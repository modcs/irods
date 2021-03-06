#!/usr/bin/env python

import shutil

from irods import lib
from irods.test import session
from irods.configuration import IrodsConfig
from irods import test
import test.settings

test_user_list = ['alice', 'bobby', 'otherrods', 'zonehopper', 'admin']
test_resc_list = ['AnotherResc', 'TestResc', 'pt', 'leaf']

# make admin session
irods_config = IrodsConfig()
admin_name = irods_config.client_environment['irods_user_name']
zone_name = irods_config.client_environment['irods_zone_name']
env_dict = lib.make_environment_dict(admin_name, test.settings.ICAT_HOSTNAME, zone_name, use_ssl=test.settings.USE_SSL)
sess = session.IrodsSession(env_dict, test.settings.PREEXISTING_ADMIN_PASSWORD, False)

# remove test stuff
for user_name in test_user_list:
    # get permission on user's collection
    sess.run_icommand('ichmod -rM own {admin_name} /{zone_name}/home/{user_name}'.format(**locals()))

    # remove test data in user's home collection
    out, _, _ = sess.run_icommand('ils /{zone_name}/home/{user_name}'.format(**locals()))
    entries = out.split()
    if len(entries) > 1:
        for entry in entries[1:]:
            # collection
            if entry.startswith('/'):
                sess.run_icommand('irm -rf {entry}'.format(**locals()))
            # data object
            elif entry != 'C-':
                sess.run_icommand('irm -f /{zone_name}/home/{user_name}/{entry}'.format(**locals()))

    # remove user
    sess.run_icommand('iadmin rmuser {user_name}'.format(**locals()))

# remove parent-child relationships
sess.run_icommand('iadmin rmchildfromresc pt leaf')

# remove resources
for resource in test_resc_list:
    sess.run_icommand('iadmin rmresc {resource}'.format(**locals()))

# remove local files
shutil.rmtree('/tmp/federation_test_stuff', ignore_errors=True)

# TODO  f 644 root root /usr/share/man/man1 ./man/*.gz

install(
  TARGETS
    irodsAgent
    irodsServer
    irodsReServer
    irodsXmsgServer
  RUNTIME
    DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/bin
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES ${CMAKE_BINARY_DIR}/VERSION.json
  DESTINATION ${IRODS_HOME_DIRECTORY}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/log
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION etc/irods
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/packaging/convert_configuration_to_json.py
  ${CMAKE_SOURCE_DIR}/packaging/core.dvm.template
  ${CMAKE_SOURCE_DIR}/packaging/core.fnm.template
  ${CMAKE_SOURCE_DIR}/packaging/core.re.template
  ${CMAKE_SOURCE_DIR}/packaging/database_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/host_access_control_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/hosts_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/server_config.json.template
  ${CMAKE_SOURCE_DIR}/packaging/update_configuration_schema.py
  ${CMAKE_SOURCE_DIR}/packaging/update_json.py
  ${CMAKE_SOURCE_DIR}/packaging/user_icat.txt
  ${CMAKE_SOURCE_DIR}/packaging/user_irodsenv.txt
  ${CMAKE_SOURCE_DIR}/packaging/user_resource.txt
  DESTINATION ${IRODS_HOME_DIRECTORY}/packaging
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/packaging/find_os.sh
  ${CMAKE_SOURCE_DIR}/packaging/postinstall.sh
  ${CMAKE_SOURCE_DIR}/packaging/preremove.sh
  DESTINATION ${IRODS_HOME_DIRECTORY}/packaging
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ WORLD_READ
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/packaging/irods
  DESTINATION etc/init.d
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
  )

set(IRODS_DOC_DIR usr/share/doc/irods)

install(
  FILES
  ${CMAKE_SOURCE_DIR}/docs/release_notes.md
  DESTINATION ${IRODS_DOC_DIR}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  RENAME RELEASE_NOTES
  )

if (CPACK_GENERATOR STREQUAL DEB)
  install(
    FILES
    ${CMAKE_SOURCE_DIR}/LICENSE
    DESTINATION ${IRODS_DOC_DIR}
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
    RENAME copyright
    )
else()
  install(
    FILES
    ${CMAKE_SOURCE_DIR}/LICENSE
    DESTINATION ${IRODS_DOC_DIR}
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
    )
endif()

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/installLogs
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY ${CMAKE_SOURCE_DIR}/scripts
  DESTINATION ${IRODS_HOME_DIRECTORY}
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/log
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/config/lockFileDir
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/config/reConfigs
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/server/config/connectControl.config.template
  ${CMAKE_SOURCE_DIR}/iRODS/server/config/irodsMonPerf.config.in
  ${CMAKE_SOURCE_DIR}/iRODS/server/config/s3Auth.template
  ${CMAKE_SOURCE_DIR}/iRODS/server/config/README.txt
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/config
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  DIRECTORY
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/config/packedRei
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/server/bin/cmd/irodsServerMonPerf
  ${CMAKE_SOURCE_DIR}/iRODS/server/bin/cmd/test_execstream.py
  ${CMAKE_SOURCE_DIR}/iRODS/server/bin/cmd/hello
  ${CMAKE_SOURCE_DIR}/iRODS/server/bin/cmd/univMSSInterface.sh
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/bin/cmd
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ WORLD_READ
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/server/bin/list.pl
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/bin
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  TARGETS
    PamAuthCheck
  RUNTIME
    DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/bin
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
    PERMISSIONS SETUID OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/server/re/include/reAction.hpp
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/re/include
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/checkIcatLog.pl
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/dataTest.pl
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/icatMiscTest.pl
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/icatTest.pl
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/moveTest.pl
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/quotaTest.pl
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/bin/specNameTest.pl
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/test/bin
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  TARGETS
    test_chl
  RUNTIME
    DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/test/bin
    COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/ltest.sh
  ${CMAKE_SOURCE_DIR}/iRODS/server/test/README.txt
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/server/test
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )

install(
  FILES
  ${CMAKE_SOURCE_DIR}/iRODS/irodsctl
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ WORLD_READ
  )

install(
  DIRECTORY ${CMAKE_SOURCE_DIR}/iRODS/clients/icommands/test
  DESTINATION ${IRODS_HOME_DIRECTORY}/iRODS/clients/icommands
  COMPONENT ${IRODS_PACKAGE_COMPONENT_SERVER_NAME}
  )


set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_NAME "irods-server")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_DEPENDS "irods-runtime (= ${IRODS_VERSION}), irods-icommands (= ${IRODS_VERSION}), libc6, sudo, libssl1.0.0, libfuse2, libjson-perl, perl, python, openssl, python-psutil, python-requests, lsof")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_CONFLICTS "eirods, irods")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_PROVIDES "eirods, irods")
set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_CONTROL_EXTRA "${CMAKE_SOURCE_DIR}/preinst;${CMAKE_SOURCE_DIR}/postinst;${CMAKE_SOURCE_DIR}/prerm;")

if (IRODS_LINUX_DISTRIBUTION_NAME STREQUAL "ubuntu" AND IRODS_LINUX_DISTRIBUTION_VERSION_MAJOR STREQUAL "12")
else()
  set(CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_DEPENDS "${CPACK_DEBIAN_${IRODS_PACKAGE_COMPONENT_SERVER_NAME}_PACKAGE_DEPENDS}, python-jsonschema")
endif()

/*** Copyright (c), The Regents of the University of California            ***
 *** For more information please refer to subStructFiles in the COPYRIGHT directory ***/
/* subStructFileClosedir.h
 */

#ifndef SUB_STRUCT_FILE_CLOSEDIR_H__
#define SUB_STRUCT_FILE_CLOSEDIR_H__

/* This is Object File I/O type API call */

#include "rcConnect.h"
#include "subStructFileRead.h"

#if defined(RODS_SERVER)
#define RS_SUB_STRUCT_FILE_CLOSEDIR rsSubStructFileClosedir
/* prototype for the server handler */
#include "rodsConnect.h"
int
rsSubStructFileClosedir( rsComm_t *rsComm, subStructFileFdOprInp_t *subStructFileClosedirInp );

int
_rsSubStructFileClosedir( rsComm_t *rsComm, subStructFileFdOprInp_t *subStructFileClosedirInp );
int
remoteSubStructFileClosedir( rsComm_t *rsComm, subStructFileFdOprInp_t *subStructFileClosedirInp,
                             rodsServerHost_t *rodsServerHost );
#else
#define RS_SUB_STRUCT_FILE_CLOSEDIR NULL
#endif

/* prototype for the client call */
int
rcSubStructFileClosedir( rcComm_t *conn, subStructFileFdOprInp_t *subStructFileClosedirInp );

#endif	// SUB_STRUCT_FILE_CLOSEDIR_H__

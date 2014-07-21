/*** Copyright (c), The Regents of the University of California            ***
 *** For more information please refer to files in the COPYRIGHT directory ***/
/* fileRmdir.h - This file may be generated by a program or script
 */

#ifndef FILE_RMDIR_HPP
#define FILE_RMDIR_HPP

/* This is a low level file type API call */

#include "rods.hpp"
#include "rcMisc.hpp"
#include "procApiRequest.hpp"
#include "apiNumber.hpp"
#include "initServer.hpp"



/* definition for flags of fileRmdirInp_t */
#define RMDIR_RECUR	0x1

typedef struct {
    int flags;
    rodsHostAddr_t addr;
    char dirName[MAX_NAME_LEN];
    char rescHier[MAX_NAME_LEN];
} fileRmdirInp_t;

#define fileRmdirInp_PI "int flag; struct RHostAddr_PI; str dirName[MAX_NAME_LEN]; str rescHier[MAX_NAME_LEN];"

#if defined(RODS_SERVER)
#define RS_FILE_RMDIR rsFileRmdir
/* prototype for the server handler */
int
rsFileRmdir( rsComm_t *rsComm, fileRmdirInp_t *fileRmdirInp );
int
_rsFileRmdir( rsComm_t *rsComm, fileRmdirInp_t *fileRmdirInp );
int
remoteFileRmdir( rsComm_t *rsComm, fileRmdirInp_t *fileRmdirInp,
                 rodsServerHost_t *rodsServerHost );
#else
#define RS_FILE_RMDIR NULL
#endif

/* prototype for the client call */
#ifdef __cplusplus
extern "C" {
#endif
    int
    rcFileRmdir( rcComm_t *conn, fileRmdirInp_t *fileRmdirInp );
#ifdef __cplusplus
}
#endif

#endif	/* FILE_RMDIR_H */

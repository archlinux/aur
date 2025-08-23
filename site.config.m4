dnl Enable local CFLAGS and LDFLAGS
define(`confLDOPTS', `${LDFLAGS}')
define(`confOPTIMIZE', `${CFLAGS}')

dnl Enable libmilter with a pool of workers
APPENDDEF(`conf_libmilter_ENVDEF', `-D_FFR_WORKERS_POOL=1')
APPENDDEF(`conf_libmilter_ENVDEF', `-DMIN_WORKERS=4')

dnl Use poll instead of select
APPENDDEF(`conf_libmilter_ENVDEF', `-DSM_CONF_POLL=1')

dnl Enable IPv6
APPENDDEF(`conf_libmilter_ENVDEF', `-DNETINET6=1')
# The following no longer needed. -shared comes in via LDOPTS_SO, and ptread via MT
#APPENDDEF(`conf_libmilter_ENVDEF', ` -shared -pthread')

dnl Permissions
APPENDDEF(`confINCGRP', `root')
APPENDDEF(`confLIBGRP', `root')
APPENDDEF(`confMBINGRP', `root')
APPENDDEF(`confSBINGRP', `root')
APPENDDEF(`confBINGRP', `root')

dnl Allow library to be stipped
define(`confLIBMODE', `644')

dnl Force libmilter to use stdbool.h for GCC23+
APPENDDEF(`confCCOPTS', ` -DSM_CONF_STDBOOL_H=1')


#############################

# Extract major version from mfapi.h
define(`LIBMILTER_MAJOR', `1')
define(`confSHAREDLIB_SUFFIX', .`defn(`LIBMILTER_MAJOR')')

# Use CC for linking
define(`confLD', `cc')

# Settings to create a SONAME for the shared library
#define(`confSONAME', `-Wl,-soname,libmilter.so.${LIBMILTER_MAJOR}'))
# In sharedlib.m4 there is the following definition, which would add "libmilter.so.1" after our confSONAME, but with a space between them. TEST whether that works, or not.
define(`confSONAME', `-Wl,-soname,')

# Extra flags for .so
APPENDDEF(`confCCOPTS_SO', ` -fPIC')

# Enable multi-threading, which enables pthread and reentrant
define(`confMT', `true')


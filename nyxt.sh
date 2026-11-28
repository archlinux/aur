#!/bin/sh
# Nyxt 5 Wrapper

# 1. Tell the OS where to find CEF's isolated shared libraries (libcef.so, libGLESv2.so, etc.)
export LD_LIBRARY_PATH="/usr/lib/nyxt"

# 2. Redirect ASDF's runtime source lookups away from the temporary build-time 
# directory. This is functionally required for Nyxt's internal help/introspection 
# system to locate source files correctly in the installed system directory.
export CL_SOURCE_REGISTRY="/usr/share/nyxt//"

exec /usr/lib/nyxt/nyxt "$@"
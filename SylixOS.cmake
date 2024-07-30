# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

# support for SylixOS https://www.sylixos.com/

# Guard against multiple inclusion, which e.g. leads to multiple calls to add_definition()
if(__SYLIXOS_CMAKE_INCLUDED)
  return()
endif()
set(__SYLIXOS_CMAKE_INCLUDED TRUE)

set(CMAKE_SHARED_LIBRARY_C_FLAGS "")            
set(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "")       
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")         
set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "")       
set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP "")   

set(CMAKE_LINK_LIBRARY_SUFFIX "")
set(CMAKE_STATIC_LIBRARY_PREFIX lib)
set(CMAKE_STATIC_LIBRARY_SUFFIX ".a")
set(CMAKE_SHARED_LIBRARY_PREFIX lib)          # lib
set(CMAKE_SHARED_LIBRARY_SUFFIX ".so")           # .so
set(CMAKE_EXECUTABLE_SUFFIX "")             #
set(CMAKE_DL_LIBS "" )

set(CMAKE_FIND_LIBRARY_PREFIXES ${CMAKE_BUILD_TYPE})
set(CMAKE_FIND_LIBRARY_SUFFIXES ".so")

include(Platform/UnixPaths)

# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

# support for SylixOS https://www.sylixos.com/

# This module is shared by multiple languages; use include blocker.
if(__SYLIXOS_COMPILER_GNU)
  return()
endif()
set(__SYLIXOS_COMPILER_GNU 1)

macro(__SylixOS_compiler_gnu lang)
  # We pass this for historical reasons.  Projects may have
  # executables that use dlopen but do not set ENABLE_EXPORTS.
  set(CMAKE_SHARED_LIBRARY_LINK_${lang}_FLAGS " ")
endmacro()

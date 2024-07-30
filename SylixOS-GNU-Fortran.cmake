# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

# support for SylixOS https://www.sylixos.com/
include(Platform/SylixOS-GNU)
__SylixOS_compiler_gnu(Fortran)
set(CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS "")

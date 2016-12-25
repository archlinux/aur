# This Python script contains all the machine dependent settings
# needed during the build process.

import sys
import popen2, os

# Get compiler flags from Gentoo's /etc/make.conf.

r, w = popen2.popen2("source /etc/make.conf ; echo $CFLAGS")
CXXFLAGS = r.readline().strip()
r.close()
w.close()

# For gcc 4.2.1, filter the flags a bit.

if "pentium-m" in CXXFLAGS or "pentium4" in CXXFLAGS:
   CXXFLAGS = CXXFLAGS.replace("-O3", "-O2")
   
# Compilers to be used.

cc  = "gcc"
cxx = "g++"
f77 = "gfortran -fPIC" # Workaround for scons bug.

# Compiler flags.
#
# Note: for the Fortran name definition you can define one of the following
#       preprocessor macros:
#
#           FORTRAN_SYMBOLS_WITHOUT_TRAILING_UNDERSCORES
#           FORTRAN_SYMBOLS_WITH_SINGLE_TRAILING_UNDERSCORE
#           FORTRAN_SYMBOLS_WITH_DOUBLE_TRAILING_UNDERSCORES

base_flags = "-DFORTRAN_SYMBOLS_WITH_SINGLE_TRAILING_UNDERSCORE -DNDEBUG "

flags_noopt = base_flags

flags = base_flags + " " + CXXFLAGS

fflags = flags + " -fPIC "

# Linker and linker flags to be used.

link = cxx
link_flags = ""

# Include directories.

include_dirs = []

if os.path.isdir("/usr/include/python2.7"):
   include_dirs.append("/usr/include/python2.7")   
   include_dirs.append("/usr/lib/python2.7/site-packages")
elif os.path.isdir("/usr/include/python2.5"):
   include_dirs.append("/usr/include/python2.5")   
   include_dirs.append("/usr/lib/python2.5/site-packages")
elif os.path.isdir("/usr/include/python2.4"):
   include_dirs.append("/usr/include/python2.4")
   include_dirs.append("/usr/lib/python2.4/site-packages")
elif os.path.isdir("/usr/include/python2.3"):
   include_dirs.append("/usr/include/python2.3")   
   include_dirs.append("/usr/lib/python2.3/site-packages")
else:
   print "Python dir not found!"
   sys.exit()

# Library directories.

library_dirs = []
#library_dirs = ["/opt/intel/mkl8/lib/32"]

# Library names.

libs = ["boost_python", "blitz", "lapack", "blas", "gfortran"]
#libs = ["boost_python", "blitz", "mkl_lapack64", "mkl", "gfortran"]

# Command to strip library of excess symbols:

dllsuffix = ".so"
strip_command = "strip --strip-unneeded camfr/_camfr" + dllsuffix

# Extra files to copy into installation directory.

extra_files = [("doc", ["docs/camfr.pdf"])]

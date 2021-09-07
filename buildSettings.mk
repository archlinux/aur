# This master make file is based on the "old"
# systemvars.mk and externallibs.mk files from:
# 	apple-darwin13-llvm6.0
# 	linux_64-gcc4.4
# 	linux_64-gcc4.8

# get system type (Darwin, Linux)
SYSTYPE := $(shell uname -s)
#####################################################################
#
#               System Vars (common)
#
#####################################################################
SHELL = /bin/sh
RM = /bin/rm
CP = /bin/cp
MV = /bin/mv
CHMOD = /bin/chmod
MKDIR = /bin/mkdir
INSTALL = install -p 
TCLSH = /usr/bin/tclsh
DEPENDFLAGS = -MM
MACHDBGFLAGS = -g
#####################################################################
#
#               External libs (common)
#
#####################################################################
FSLEXTLIB=${FSLDIR}/extras/lib
FSLEXTINC=${FSLDIR}/extras/include
FSLEXTBIN=${FSLDIR}/extras/bin
# CEPHES library
LIB_CEPHES = ${FSLEXTLIB}
INC_CEPHES = ${FSLEXTINC}/cephes
# GD library
LIB_GD = /usr/lib
INC_GD = /usr/include
# GDC library
LIB_GDC = ${FSLEXTLIB}
INC_GDC = ${FSLEXTINC}/libgdc
# GSL library
LIB_GSL = /usr/lib
INC_GSL = /usr/include/gsl
# PNG library
LIB_PNG = /usr/lib
INC_PNG = /usr/include/libpng16
# PROB library; added -I${FSLEXTINC} for 6.0.5
LIB_PROB = ${FSLEXTLIB}
INC_PROB = ${FSLEXTINC}/cprob -I${FSLEXTINC}
# CPROB library
LIB_CPROB = ${FSLEXTLIB}
INC_CPROB = ${FSLEXTINC}/
# NEWRAN library
LIB_NEWRAN = ${FSLEXTLIB}
INC_NEWRAN = ${FSLEXTINC}/newran
# BOOST library
BOOSTDIR = ${FSLEXTINC}/boost
LIB_BOOST = /usr/lib
INC_BOOST = /usr/include/boost
# QWT library
QWTDIR = /usr
INC_QWT = ${QWTDIR}/include/qwt
LIB_QWT = ${QWTDIR}/lib
# FFTW3 library
LIB_FFTW3 = /usr/lib
INC_FFTW3 = /usr/include
# LIBXML2 library
INC_XML2 = /usr/include/libxml2
# LIBXML++ library
INC_XML++ = /usr/include/libxml++-2.6
INC_XML++CONF = /usr/lib/libxml++-2.6/include
# NEWMAT library/armadillo
INC_NEWMAT = ${FSLEXTINC}/armawrap/armawrap -DARMA_USE_LAPACK -DARMA_USE_BLAS -DARMA_64BIT_WORD
#####################################################################
#
#       Linux specific sys vars and ext libs
#				Makefile auto-detects gcc version for Linux
#
#####################################################################
ifeq ($(SYSTYPE), Linux)
###############   System Vars   #####################################
CC = gcc-9
CXX = c++-9
CXX11 = c++-9
CSTATICFLAGS = -static
CXXSTATICFLAGS = -static
ARCHFLAGS = -m64
ARCHLDFLAGS = -Wl,-rpath,'$$ORIGIN/../lib'
PARALLELFLAGS = -fopenmp
OPTFLAGS = -g -O3 -fexpensive-optimizations ${ARCHFLAGS}
GNU_ANSI_FLAGS = -Wall -ansi -pedantic -Wno-long-long -std=c++11
SGI_ANSI_FLAGS = -ansi -fullwarn
ANSI_FLAGS = ${GNU_ANSI_FLAGS}
RANLIB = echo
FSLML = ${FSLDIR}/bin/fslml
# CUDA development environment
CUDAVER := $(or $(CUDAVER),9.1)
#$(info $$CUDAVER is [${CUDAVER}])
CUDA_INSTALLATION = /opt/cuda
GENCODE_FLAGS = $(shell ${FSLDIR}/config/common/supportedGencodes.sh ${CUDA_INSTALLATION})
LIB_CUDA = ${CUDA_INSTALLATION}/lib64
INC_CUDA = ${CUDA_INSTALLATION}/include
NVCC = ${CUDA_INSTALLATION}/bin/nvcc
###############   External Libs   #####################################
# ZLIB library
LIB_ZLIB = /usr/lib
INC_ZLIB = /usr/include
# QT library
QTDIR = /usr/
LIB_QT = ${QTDIR}/lib
INC_QT = ${QTDIR}/include/qt
# VTK library
VTKDIR_INC = /usr/include/vtk
VTKDIR_LIB = /usr/lib
VTKSUFFIX =
# openblas
LIB_NEWMAT = /usr/lib -llapack -lopenblas
# get and then parse gcc version to run context specific builds
#GCCVER := $(shell gcc -dumpversion)
#GCCARR = $(subst ., ,$(GCCVER))
#$(info $(GCCVER))
#GCCMAJ = $(word 1, $(GCCARR))
#GCCMIN = $(word 2, $(GCCARR))
#GCCPAT = $(word 3, $(GCCARR))
#$(info GCC MAJ VER $(GCCMAJ))
#$(info GCC MIN VER $(GCCMIN))
#$(info GCC PAT VER $(GCCPAT))

#Project specific variables
EDDYBUILDPARAMETERS = "cuda=1 CUDAVER=9.1" "cuda=1 CUDAVER=9.1" "cpu=1"
fdt_MASTERBUILD     = COMPILE_GPU = 0
ptx2_MASTERBUILD    = COMPILE_GPU = 0
define newline


endef
#PTX2_MASTER_COMMANDS = COMPILE_GPU = 1$(newline)FOO=2
endif # if Linux


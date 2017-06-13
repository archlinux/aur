# $Id: systemvars.mk,v 1.1 2017/02/18 12:20:05 mwebster Exp $

# System dependent paths

RM = /bin/rm
CHMOD = /bin/chmod
MKDIR = /bin/mkdir
CP = /bin/cp
MV = /bin/mv
INSTALL = install -p
TCLSH = /usr/bin/tclsh
RANLIB = echo

FSLML = ${FSLDIR}/bin/fslml

# for SHELL, do not change the type of shell - only use Bourne or BASH
SHELL = /bin/sh

# Compiler dependent variables

CC = gcc
CXX = c++
CXX11 = c++
CSTATICFLAGS = -static
CXXSTATICFLAGS = -static

ARCHFLAGS = -m64 

PARALLELFLAGS = -fopenmp

DEPENDFLAGS = -MM

OPTFLAGS = -march=native -O3 -fexpensive-optimizations ${ARCHFLAGS}
MACHDBGFLAGS = -g
GNU_ANSI_FLAGS = -Wall -ansi -pedantic -std=c++11 -Wno-long-long
SGI_ANSI_FLAGS = -ansi -fullwarn
ANSI_FLAGS = ${GNU_ANSI_FLAGS}

# CUDA development environment
CUDA_INSTALLATION = /opt/cuda
GENCODE_FLAGS = $(shell ${FSLDIR}/config/common/supportedGencodes.sh ${CUDA_INSTALLATION})
LIB_CUDA = ${CUDA_INSTALLATION}/lib64
INC_CUDA = ${CUDA_INSTALLATION}/include
NVCC = ${CUDA_INSTALLATION}/bin/nvcc
NVCC11=${CUDA_INSTALLATION}/bin/nvcc

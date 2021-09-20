#!/bin/bash

# Test if external packages for PETSC are installed

# CONFOPTS=""

# # External downloads
# for external_pkg in hypre fblaslapack metis parmetis superlu_dist mumps scalapack; do
# 	CONFOPTS+=" --download-${external_pkg}=1"
# done

type mpicc >/dev/null && CONFOPTS+=" --with-cc=mpicc"
type mpicxx >/dev/null && CONFOPTS+=" --with-cxx=mpicxx"
type mpifort >/dev/null && CONFOPTS+=" --with-fc=mpifort"

# BOOST: Free peer-reviewed portable C++ source libraries
if [ -f "$(whereis -b libboost_mpi.so | cut -d' ' -f2)" ]; then
    CONFOPTS+=" --with-boost=1"
fi;

# CGNS: Recording and recovering computer data
if [ -f "$(whereis -b libcgns.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-cgns=1"
fi

# eigen: Lightweight C++ template library for vector and matrix math
EIGEN_DIR="$(pkgconf --cflags-only-I eigen3)"
EIGEN_DIR="${EIGEN_DIR##-I}"
if [ -d "${EIGEN_DIR}" ]; then
	CONFOPTS+=" --with-eigen=1 --with-eigen-include=${EIGEN_DIR}"
fi

# fftw: Fast-Fourier Transform
if [ -f "$(whereis -b libfftw3_mpi.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-fftw=1"
fi

# GDB: GNU debugger
if [ -f "$(whereis -b gdb | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-debugger=gdb"
fi

# # GLUT (requires OpenGL)
# if [ -f "$(whereis -b libglut.so | cut -d' ' -f2)" ]; then
# 	CONFOPTS+=" --with-glut=1"
#     CONFOPTS+=" --with-glut-pkg-config="
#     CONFOPTS+="$(dirname $(pkgconf --path glut))"
# fi

# HDF5: large files
if [[ "$(h5stat -V)" ]]; then
	CONFOPTS+=" --with-hdf5=1"
fi

# hwloc: abstraction of hierarchical architectures
if [ -f "$(whereis -b libhwloc.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-hwloc=1"
    CONFOPTS+=" --with-hwloc-pkg-config="
    CONFOPTS+="$(dirname $(pkgconf --path hwloc))"
fi

# Hypre: Large and sparse linear with massive parallel computing
if [ -f "$(whereis -b libHYPRE.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-hypre=1"
	CONFOPTS+=" --with-hypre-lib=[/usr/lib/libHYPRE.so]"
	CONFOPTS+=" --with-hypre-include=/usr/include"
fi

# MED: Data Modelization and Exchanges (meshes)
if [ -f "$(whereis -b libmed.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-med=1"
fi

# METIS: Automatic meshing partitioning
if [ -f "$(whereis -b libmetis.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-metis=1"
	# parmetis support
	if [ -f "/usr/include/parmetis.h" ]; then
		CONFOPTS+=" --with-parmetis=1"
	fi
fi

# # MPI4Py
# if [ -n "$(pacman -Qsq mpi4py)" ]; then
#     mpi4py_inc="$(pacman -Ql python-mpi4py | awk '/mpi4py.h$/{print $NF}')"
# 	CONFOPTS+=" --with-mpi4py=1"
#     CONFOPTS+=" --with-mpi4py-include="
#     CONFOPTS+="$(dirname $mpi4py_inc)"
#     CONFOPTS+=" --with-mpi4py-lib="
#     CONFOPTS+="$(pacman -Ql python-mpi4py | awk '/.*\.so$/{print $NF}' | tr ' \n' ',')"
# fi

# MUMPS: Sparse solver library
if [ -f "$(whereis -b libmumps_common.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-mumps=1"
    # MUMPS_LIBS="[/usr/lib/libcmumps.so,"
    # MUMPS_LIBS+="/usr/lib/libdmumps.so,"
    # MUMPS_LIBS+="/usr/lib/libsmumps.so,"
    # MUMPS_LIBS+="/usr/lib/libzmumps.so,"
    # MUMPS_LIBS+="/usr/lib/libmumps_common.so,"
    # MUMPS_LIBS+="/usr/lib/libpord.so]"
    # CONFOPTS+=" --with-mumps-lib=${MUMPS_LIBS}"
    # CONFOPTS+=" --with-mumps-include=/usr/include"
    # CONFOPTS+=" --with-mumps-dir=/usr/"
fi

# NetCDF
if [ -f "$(whereis -b libnetcdf.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-netcdf=1"
    CONFOPTS+=" --with-netcdf-pkg-config="
    CONFOPTS+="$(dirname $(pkgconf --path netcdf))"
fi

# PNG
if [ -f "$(whereis -b libpng.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-png=1"
    CONFOPTS+=" --with-png-pkg-config="
    CONFOPTS+="$(dirname $(pkgconf --path libpng))"
fi

# PNetCDF
if [ -f "$(whereis -b libpnetcdf.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-pnetcdf=1"
    CONFOPTS+=" --with-pnetcdf-pkg-config="
    CONFOPTS+="$(dirname $(pkgconf --path pnetcdf))"
fi

# OpenBLAS: Linear algebra libraries
OPENBLAS_SO="$(whereis -b libblas.so | cut -d' ' -f2)"
if [ -f "${OPENBLAS_SO}" ]; then
	CONFOPTS+=" --with-openblas=1"
	# CONFOPTS+=" --with-openblas-lib=[-lopenblas,-lm,-lpthread,-lgfortran,-lm,-lpthread,-lgfortran]"
	# CONFOPTS+=" --with-openblas-include=/usr/include"
	CONFOPTS+=" --with-openblas-pkg-config="
    CONFOPTS+="$(dirname $(pkgconf --path openblas))"
	# CONFOPTS+=" --download-openblas=0"
	CONFOPTS+=" --download-f2cblaslapack=0"
fi

# OpenCL: GPU computing
# Check header files
# (from opencl-headers package; how to do this in a consistent way?)
OPENCL_INC="/usr/include/CL/cl.h"
# Check library (find libOpenCL.so)
OPENCL_SO="$(whereis -b libOpenCL.so | cut -d' ' -f2)"
if [ -f "${OPENCL_SO}" ] && [ -f "${OPENCL_INC}" ]; then
	CONFOPTS+=" --with-opencl=1"
fi

# # OpenGL (mesa)
# # echo /lib64/libOpenGL.so /lib64/libGLX.so /lib64/libGLU.so
# # FindOpenGL found both a legacy GL library:
# #
# #     OPENGL_gl_LIBRARY: /lib64/libGL.so
# #
# # and GLVND libraries for OpenGL and GLX:
# #
# #     OPENGL_opengl_LIBRARY: /lib64/libOpenGL.so
# #     OPENGL_glx_LIBRARY: /lib64/libGLX.so
# OPENGLIB="$(whereis -b libOpenGL.so | cut -d' ' -f2)"
# if [ -f "${OPENGLIB}" ]; then
# #    OPENGLIB+=",$(whereis -b libGL | cut -d' ' -f2),"
#     # OPENGLIB+=",$(whereis -b libGLX | cut -d' ' -f2)"
#     # OPENGLIB+=",$(whereis -b libGLX | cut -d' ' -f2)"
#     # # OPENGLIB+="$(pacman -Ql mesa | awk '/\.so$/{print $NF}' | tr ' \n' ',')"
# 	# CONFOPTS+=" --with-opengl=1"
#     # CONFOPTS+=" --with-opengl-lib=[${OPENGLIB}]"
#     # CONFOPTS+=" --with-opengl-include=[/usr/include/GL/glew.h]"
# 	CONFOPTS+=" --with-opengl=1"
#     CONFOPTS+=" --with-opengl-pkg-config="
#     CONFOPTS+="$(dirname $(pkgconf --path opengl))"
#     # CONFOPTS+="$(pacman -Ql mesa | awk '/\/include\/[^/]*\/$/{print $NF}' | tr ' \n' ',')]"
# fi

# OpenMP: 64 bits blas and lapack, multi-threaded
if [ -f "$(whereis -b libomp.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-openmp=1"
fi

# # OpenMPI (dependency; should be found by pacman)
# MPILIBDIR=$(dirname "$(pacman -Qlq openmpi | grep 'libmpi.so$')")
# MPIINC="$(pacman -Qlq openmpi | grep 'mpi.h$')"
# if [ -d "${MPILIBDIR}" ]; then
# 	CONFOPTS+=" --with-mpi=1"
#     CONFOPTS+=" --with-mpi-dir=/usr/"
# fi

# Scalapack: Parallel memory linear algebra
if [ -f "$(whereis -b libscalapack.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-scalapack=1"
fi

# Scotch: Partitioning with sparse matrices
# TODO: programatic way
SCOTCH_DIR="/usr/include/scotch"
if [ -d "${SCOTCH_DIR}" ]; then
	# SCOTCH_LIBS="$(ldconfig -p | awk '/scotch/{printf("'"${SCOTCH_DIR}"'/%s,", $1)}')"
	SCOTCH_LIBS="libesmumps.so,libptscotch.so,libptscotcherr.so,libscotch.so,libscotcherr.so"

	# Include bzip2 if scotch was built with bzip2 support
	if [ -f "$(whereis -b libbz2.so | cut -d' ' -f2)" ]; then
		SCOTCH_LIBS+=",${SCOTCH_DIR}/libbz2.so"
	fi
    # Add [], remove trailing ,
	SCOTCH_LIBS="[${SCOTCH_LIBS}]"
	CONFOPTS+=" --with-ptscotch=1"
    CONFOPTS+=" --with-ptscotch-lib=${SCOTCH_LIBS}"
    CONFOPTS+=" --with-ptscotch-include=${SCOTCH_DIR}"
fi

# SuiteSparse: Sparse matrix library
if [ -f "$(whereis -b libsuitesparseconfig.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-suitesparse=1"
fi

# SuperLU: Subroutines for sparsse linear systems
# TODO: programatic way
SUPERLU_DIR="/usr/include/superlu"
if [ -d "${SUPERLU_DIR}" ]; then
	CONFOPTS+=" --with-superlu=1 --with-superlu-lib=-lsuperlu --with-superlu-include=${SUPERLU_DIR}"
fi

# YAML: configuration files
# Check library (find libyaml.so)
OPENCL_SO="$(whereis -b libyaml.so | cut -d' ' -f2)"
if [ -f "${OPENCL_SO}" ]; then
	CONFOPTS+=" --with-yaml=1"
fi

# X: to enable ksp_xmonitor
LIBX11="$(whereis -b libX11.so | cut -d' ' -f2)"
LIBX11_DIR="$(dirname ${LIBX11})"
if [ -f "${LIBX11}" ]; then
    LIBX11_INC="--keep-system-cflags --cflags-only-I";
    LIBX11_INC="$(pkgconf ${LIBX11_INC} x11)";
	CONFOPTS+=" --with-x-lib=[${LIBX11_DIR}/";
    # As per X11.pc, it seems that xcb.so is needed
    CONFOPTS+="libX11-xcb.so,${LIBX11}]"
    CONFOPTS+=" --with-x-include=${LIBX11_INC//-I/}"
fi

# ZLIB
if [ -f "$(whereis -b libzlib.so | cut -d' ' -f2)" ]; then
	CONFOPTS+=" --with-zlib=1"
    CONFOPTS+=" --with-zlib-pkg-config="
    CONFOPTS+="$(dirname $(pkgconf --path zlib))"
fi

# # trilinos support
#
# if [ "${TRILINOS_DIR}" ]; then
# 	CONFOPTS+=" --with-ml-dir=${TRILINOS_DIR}"
# 	# boost support (may be useful for trilinos)
# 	CONFOPTS+=" --with-boost=1"
# fi

# Incompatible with complex
# # sundials support
# SUNDIALS_DIR="/usr/include/sundials/"
# if [ -d "${SUNDIALS_DIR}" ]; then
# 	CONFOPTS+=" --with-sundials=1 --with-sundials-include=${SUNDIALS_DIR}"
# fi

# # pastix support (non-free)
# PASTIX_CONF=$(which pastix-conf)
# if [ -f "${PASTIX_CONF}" ]; then
# 	PASTIX_DIR="$($PASTIX_CONF --incs | sed 's/-I//')"
# 	if [ ! -d ${PASTIX_DIR} ]; then
# 		PASTIX_DIR="[]"
# 	fi
# 	#PASTIX_LIBS="$($PASTIX_CONF --libs)"
# 	PASTIX_LIBS="[libpastix.a,librt.so,libhwloc.so,libpthread.a]"
# 	CONFOPTS+=" --with-pastix=1 --with-pastix-lib=${PASTIX_LIBS} --with-pastix-include=${PASTIX_DIR}"
# fi

echo "${CONFOPTS}"

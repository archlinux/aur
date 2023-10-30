#!/bin/bash

# Test if external packages for PETSC are installed

# Fair attempt to find the directory of a header file
find_inc () {
    local INC;
    INC="$(find_so "$1")";
    # * Faster first
    if [ -f "${INC}" ]; then
        INC="${INC}";
    elif [ -f "${INC}"/"$1" ]; then
        # ** The header is inside INC (a directory) e.g.
        #    /usr/include/scotch
        #    /usr/include/scotch/scotch.h
        INC="${INC}"/"$1"
    elif [ -d "${INC}" ]; then
        # ** INC is a directory, and the header is deep inside
        #    (hopefully faster than `pacman')
        INC="$(find "${INC}" -name "$1" -print -quit)";
    elif [ ! "x$2" == "x" ]; then
        # ** May be there is a package?
        pacman -Qs "$2" 2>&1>/dev/null && \
            INC="$(pacman -Qlq "$2" | grep "/$1\$" || printf "")";
    fi;
    dirname "${INC}"
}

# Find a shared object (library; .so extension)
#   example: find_so libboost_mpi
find_so () {
    whereis -b "$1" | cut -d' ' -f2
}

# Find directory where a pkg-config file is
#   example: find_pc glut
find_pc () {
    dirname "$(pkgconf --path "$1")"
}

ONLY_INC="--keep-system-cflags --cflags-only-I";

MPICC=$(type -p mpicc)
[[ -f ${MPICC} ]] && CONFOPTS="${CONFOPTS} --with-cc=$(which mpicc)"
MPICXX=$(type -p mpicxx)
[[ -f ${MPICXX} ]] && CONFOPTS="${CONFOPTS} --with-cxx=$(which mpicxx)"
MPIFORT=$(type -p mpifort)
[[ -f ${MPIFORT} ]] && CONFOPTS="${CONFOPTS} --with-fc=$(which mpifort)"

# BOOST: Free peer-reviewed portable C++ source libraries
if [ -f "$(find_so libboost_mpi.so)" ]; then
    CONFOPTS="${CONFOPTS} --with-boost=1"
fi;

# CGNS: Recording and recovering computer data
CGNS_LIB="$(find_so libcgns.so)"
if [ -f "${CGNS_LIB}" ] && [ -n "$(nm -D /usr/lib/libcgns.so | grep cgp_open | cut -d" " -f3)" ]; then
    # CGNS_INC="$(find_inc "cgnslib.h" "cgns")"
    # CONFOPTS+=" -I${CGNS_INC}"
    # CONFOPTS+=" ${CGNS_LIB}"
	CONFOPTS="${CONFOPTS} --with-cgns=1"
    # CONFOPTS+=" --with-cgns-lib=${CGNS_LIB}"
	# CONFOPTS+=" --with-cgns-include=${CGNS_INC}"
else
    CONFOPTS="${CONFOPTS} --with-cgns=0"
fi

# eigen: Lightweight C++ template library for vector and
# matrix math
EIGEN_DIR="$(pkgconf --cflags-only-I eigen3)"
EIGEN_DIR="${EIGEN_DIR##-I}"
if [ -d "${EIGEN_DIR}" ]; then
	CONFOPTS="${CONFOPTS} --with-eigen=1"
	CONFOPTS="${CONFOPTS} --with-eigen-include=${EIGEN_DIR}"
fi

# fftw: Fast-Fourier Transform
if [ -f "$(find_so libfftw3_mpi.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-fftw=1"
fi

# GDB: GNU debugger
if [ -f "$(find_so gdb)" ]; then
	CONFOPTS="${CONFOPTS} --with-debugger=gdb"
fi

# # GLUT (requires OpenGL)
# if [ -f "$(find_so libglut.so)" ]; then
# 	CONFOPTS="${CONFOPTS} --with-glut=1"
#     CONFOPTS="${CONFOPTS} --with-glut-pkg-config="
#     CONFOPTS="${CONFOPTS} $(find_pc glut)"
# fi

# HDF5: large files
if [[ "$(h5stat -V)" ]]; then
	CONFOPTS="${CONFOPTS} --with-hdf5=1"
fi

# hwloc: abstraction of hierarchical architectures
if [ -f "$(find_so libhwloc.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-hwloc=1"
    CONFOPTS="${CONFOPTS} --with-hwloc-pkg-config="
    CONFOPTS="${CONFOPTS} $(find_pc hwloc)"
fi

# Hypre: Large and sparse linear with massive parallel
# computing
HYPRE_SO="$(find_so libHYPRE.so)"
if [ -f "${HYPRE_SO}" ]; then
	CONFOPTS="${CONFOPTS} --with-hypre=1"
	CONFOPTS="${CONFOPTS} --with-hypre-lib=${HYPRE_SO}"
    HYPRE_INC="$(find_inc "HYPRE.h" "hypre")"
	CONFOPTS="${CONFOPTS} --with-hypre-include=${HYPRE_INC}"
fi

# MED: Data Modelization and Exchanges (meshes)
if [ -f "$(find_so libmed.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-med=1"
fi

# METIS: Automatic meshing partitioning
if [ -f "$(find_so libmetis.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-metis=1"
	# parmetis support
	if [ -f "/usr/include/parmetis.h" ]; then
		CONFOPTS="${CONFOPTS} --with-parmetis=1"
	fi
fi

# # MPI4Py
# if [ -n "$(pacman -Qsq mpi4py)" ]; then
#     mpi4py_inc="$(pacman -Ql python-mpi4py | awk '/mpi4py.h$/{print $NF}')"
# 	CONFOPTS="${CONFOPTS} --with-mpi4py=1"
#     CONFOPTS="${CONFOPTS} --with-mpi4py-include="
#     CONFOPTS="${CONFOPTS} $(dirname "${mpi4py_inc}")"
#     CONFOPTS="${CONFOPTS} --with-mpi4py-lib="
#     CONFOPTS="${CONFOPTS} $(pacman -Ql python-mpi4py | awk '/.*\.so$/{print $NF}' | tr ' \n' ',')"
# fi

# MUMPS: Sparse solver library
if [ -f "$(find_so libmumps_common.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-mumps=1"
fi

# NetCDF
if [ -f "$(find_so libnetcdf.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-netcdf=1"
    CONFOPTS="${CONFOPTS} --with-netcdf-pkg-config="
    CONFOPTS="${CONFOPTS} $(find_pc netcdf)"
fi

# PNG
if [ -f "$(find_so libpng.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-png=1"
    CONFOPTS="${CONFOPTS} --with-png-pkg-config="
    CONFOPTS="${CONFOPTS} $(find_pc libpng)"
fi

# PNetCDF
if [ -f "$(find_so libpnetcdf.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-pnetcdf=1"
    CONFOPTS="${CONFOPTS} --with-pnetcdf-pkg-config="
    CONFOPTS="${CONFOPTS} $(find_pc pnetcdf)"
fi

# OpenBLAS: Linear algebra libraries
BLAS_SO="$(find_so libblas.so)"
OPENBLAS_SO="$(find_so libopenblas.so)"
LAPACK_SO="$(find_so liblapack.so)"
if [ -f "${BLAS_SO}" ] && [ -f "${OPENBLAS_SO}" ] \
       && [ -f "${LAPACK_SO}" ]; then
    # With help from Satish Balay
    # @ 3.15.4.33.g0bac13e0fe9 2021-09-21
    #  nm -AoD /usr/lib64/libopenblas.so | grep dgetrs_
    CONFOPTS="${CONFOPTS} --with-blaslapack-lib=[${LAPACK_SO},${BLAS_SO}]"
fi

# OpenCL: GPU computing
# Check header files
# (from opencl-headers package; how to do this in a consistent way?)
OPENCL_INC="/usr/include/CL/cl.h"
# Check library (find libOpenCL.so)
OPENCL_SO="$(find_so libOpenCL.so)"
if [ -f "${OPENCL_SO}" ] && [ -f "${OPENCL_INC}" ]; then
	CONFOPTS="${CONFOPTS} --with-opencl=1"
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
# OPENGLIB="$(find_so libOpenGL.so)"
# if [ -f "${OPENGLIB}" ]; then
# #    OPENGLIB+=",$(find_so libGL),"
#     # OPENGLIB+=",$(find_so libGLX)"
#     # OPENGLIB+=",$(find_so libGLX)"
#     # # OPENGLIB+="$(pacman -Ql mesa | awk '/\.so$/{print $NF}' | tr ' \n' ',')"
# 	# CONFOPTS="${CONFOPTS} --with-opengl=1"
#     # CONFOPTS="${CONFOPTS} --with-opengl-lib=[${OPENGLIB}]"
#     # CONFOPTS="${CONFOPTS} --with-opengl-include=[/usr/include/GL/glew.h]"
# 	CONFOPTS="${CONFOPTS} --with-opengl=1"
#     CONFOPTS="${CONFOPTS} --with-opengl-pkg-config="
#     CONFOPTS="${CONFOPTS} $(dirname $(pkgconf --path opengl))"
#     # CONFOPTS="${CONFOPTS} $(pacman -Ql mesa | awk '/\/include\/[^/]*\/$/{print $NF}' | tr ' \n' ',')]"
# fi

# OpenMP: 64 bits blas and lapack, multi-threaded
if [ -f "$(find_so libomp.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-openmp=1"
fi

# # OpenMPI (dependency; should be found by pacman)
# MPILIBDIR=$(dirname "$(pacman -Qlq openmpi | grep 'libmpi.so$')")
# MPIINC="$(pacman -Qlq openmpi | grep 'mpi.h$')"
# if [ -d "${MPILIBDIR}" ]; then
# 	CONFOPTS="${CONFOPTS} --with-mpi=1"
#     CONFOPTS="${CONFOPTS} --with-mpi-dir=/usr/"
# fi

# Scalapack: Parallel memory linear algebra
if [ -f "$(find_so libscalapack.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-scalapack=1"
fi

# Scotch: Partitioning with sparse matrices
# TODO: general (non-pacman) way
PTSCOTCH_SO="$(find_so libptscotch.so)"
if [ -f "${PTSCOTCH_SO}" ]; then
	CONFOPTS="${CONFOPTS} --with-ptscotch=1"
    SCOTCH_LIBS=$(pacman -Qlq scotch | grep '.so$'| tr '\n' ',')
    # Check if libscotch was compiled with bz2
    if [ ! -z "$(nm -D $(find_so libscotch.so) | grep bz)" ]; then
        SCOTCH_LIBS="${SCOTCH_LIBS}$(find_so libbz2.so)"
    else
        # Remove trailing ,
        SCOTCH_LIBS="${SCOTCH_LIBS%%,}"
    fi;
    CONFOPTS="${CONFOPTS} --with-ptscotch-lib=[${SCOTCH_LIBS}]"
    CONFOPTS="${CONFOPTS} --with-ptscotch-include="
    CONFOPTS="${CONFOPTS}$(find_inc ptscotch.h scotch)"
fi

# SuiteSparse: Sparse matrix library
if [ -f "$(find_so libsuitesparseconfig.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-suitesparse=1"
fi

# SuperLU: Subroutines for sparsse linear systems
# TODO: programatic way
SUPERLU_DIR="/usr/include/superlu"
if [ -d "${SUPERLU_DIR}" ]; then
	CONFOPTS="${CONFOPTS} --with-superlu=1"
	CONFOPTS="${CONFOPTS} --with-superlu-lib=-lsuperlu"
	CONFOPTS="${CONFOPTS} --with-superlu-include=${SUPERLU_DIR}"
fi

# YAML: configuration files
# Check library (find libyaml.so)
OPENCL_SO="$(find_so libyaml.so)"
if [ -f "${OPENCL_SO}" ]; then
	CONFOPTS="${CONFOPTS} --with-yaml=1"
fi

# X: to enable ksp_xmonitor
LIBX11_SO="$(find_so libX11.so)"
LIBX11_DIR="$(dirname ${LIBX11_SO})"
if [ -f "${LIBX11_SO}" ]; then
    LIBX11_INC="$(pkgconf ${ONLY_INC} x11)";
    LIBX11_INC="${LIBX11_INC//-I/}";
	CONFOPTS="${CONFOPTS} --with-x-lib=[${LIBX11_DIR}/";
    # As per X11.pc, it seems that xcb.so is needed
    CONFOPTS="${CONFOPTS}libX11-xcb.so,${LIBX11_SO}]"
    CONFOPTS="${CONFOPTS} --with-x-include=${LIBX11_INC}"
fi

# ZLIB
if [ -f "$(find_so libzlib.so)" ]; then
	CONFOPTS="${CONFOPTS} --with-zlib=1"
    CONFOPTS="${CONFOPTS} --with-zlib-pkg-config="
    CONFOPTS="${CONFOPTS} $(find_pc zlib)"
fi

# # trilinos support
#
# if [ "${TRILINOS_DIR}" ]; then
# 	CONFOPTS="${CONFOPTS} --with-ml-dir=${TRILINOS_DIR}"
# 	# boost support (may be useful for trilinos)
# 	CONFOPTS="${CONFOPTS} --with-boost=1"
# fi

# Incompatible with complex
# # sundials support
# SUNDIALS_DIR="/usr/include/sundials/"
# if [ -d "${SUNDIALS_DIR}" ]; then
# 	CONFOPTS="${CONFOPTS} --with-sundials=1"
# 	CONFOPTS="${CONFOPTS} --with-sundials-include=${SUNDIALS_DIR}"
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
# 	CONFOPTS="${CONFOPTS} --with-pastix=1"
# 	CONFOPTS="${CONFOPTS} --with-pastix-lib=${PASTIX_LIBS}"
# 	CONFOPTS="${CONFOPTS} --with-pastix-include=${PASTIX_DIR}"
# fi

echo "${CONFOPTS}"

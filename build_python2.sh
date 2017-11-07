#!/bin/sh
# This shell script repeats building scipy with and without an environment variable needed since newest versions of
# the intel C compiler lack support for float128 while glibc expects this.
# The set environment variable, however, precludes compiling C++ code
# So, if the build process fails, it is re-run without the environment variable und continues until failing again etc.
{
	# try the following code
        python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	# if that fails add environment variable
	__INTEL_PRE_CFLAGS=" -D_Float128=__float128" python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	#if that fails try again without
        python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	# if that fails add environment variable
	__INTEL_PRE_CFLAGS=" -D_Float128=__float128" python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	#if that fails try again without
        python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	# if that fails add environment variable
	__INTEL_PRE_CFLAGS=" -D_Float128=__float128" python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	#if that fails try again without
        python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	# if that fails add environment variable
	__INTEL_PRE_CFLAGS=" -D_Float128=__float128" python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	#if that fails try again without
        python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	# if that fails add environment variable
	__INTEL_PRE_CFLAGS=" -D_Float128=__float128" python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
} || {
	#if that fails try again without
        python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
}

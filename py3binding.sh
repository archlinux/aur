#!/bin/sh
_py3ver=`python3 --version | grep -oP '(?<= )\d\.\d'`
_py3include=/usr/include/`ls /usr/include |  grep python3`
_pkgname="mitsuba"

_CFLAGS="-DMTS_BUILD_MODULE=MTS_MODULE_PYTHON -DMTS_DEBUG -DMTS_HAS_COHERENT_RT -DMTS_HAS_COLLADA=1 -DMTS_HAS_FFTW=1 -DMTS_HAS_LIBJPEG=1 -DMTS_HAS_LIBPNG=1 -DMTS_HAS_OPENEXR=1 -DMTS_SSE -DPyMitsuba_EXPORTS -DSINGLE_PRECISION -DSPECTRUM_SAMPLES=3 -fvisibility=hidden -pipe -march=nocona -ffast-math -Wall -Winvalid-pch -mfpmath=sse  -fopenmp -O3 -DNDEBUG -fPIC -I/usr/include/eigen3 -I/usr/include/OpenEXR -I../include -I${_py3include}"

[ -f render.cpp.o ] || g++ $_CFLAGS -o render.cpp.o -c "${1}/${_pkgname}/src/libpython/render.cpp"
[ -f core.cpp.o ] || g++ $_CFLAGS -o core.cpp.o -c "${1}/${_pkgname}/src/libpython/core.cpp"
c++ -fPIC -fvisibility=hidden -pipe -march=nocona -ffast-math \
    -Wall -Winvalid-pch -mfpmath=sse  -fopenmp -O3 -DNDEBUG  \
    -shared -Wl,-soname,mitsuba.so -o mitsuba.so render.cpp.o core.cpp.o \
    -lmitsuba-core -lmitsuba-render \
    -lz -lpng -ljpeg -lHalf -lIex -lImath -lIlmThread -lpthread -lIlmImf -lboost_thread \
    -lpthread -lIlmImf -lboost_thread -lboost_filesystem -lboost_system -ldl -lfftw3 \
    -lfftw3_threads -lrt -lboost_filesystem -lboost_system -lboost_python3 -lpython3 -lxerces-c \
    -L${1}/mitsuba/build/release/libcore -L${1}/mitsuba/build/release/librender
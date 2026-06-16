# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD
# musl-cross configuration based on the upstream template, and on musl.cc:
# https://conf.musl.cc/plain_20211122_11-2-1.txt

# TARGET is set by PKGBUILD

STAT = -static --static
# FIXME: musl.cc uses -O2, but this is probably slower and worse than -O1: https://github.com/richfelker/musl-cross-make/pull/228
FLAG = -g0 -O2 -pipe -fno-align-functions -fno-align-jumps -fno-align-loops -fno-align-labels -Wno-error

# maybe superflous, we should only need the else branch
ifneq ($(NATIVE),)
COMMON_CONFIG += CC="$(HOST)-gcc ${STAT}" CXX="$(HOST)-g++ ${STAT}" FC="$(HOST)-gfortran ${STAT}"
else
COMMON_CONFIG += CC="gcc ${STAT}" CXX="g++ ${STAT}" FC="gfortran ${STAT}"
endif

COMMON_CONFIG += CFLAGS="${FLAG}" CXXFLAGS="${FLAG}" FFLAGS="${FLAG}" LDFLAGS="-s ${STAT}"

BINUTILS_CONFIG += --enable-gold=yes
GCC_CONFIG += --enable-default-pie --enable-static-pie --disable-cet

# ideally, use most current versions available in https://github.com/richfelker/musl-cross-make/tree/master/patches
GCC_VER = 16.1.0
BINUTILS_VER = 2.44
MUSL_VER = 1.2.5
GMP_VER = 6.3.0
MPC_VER = 1.3.1
ISL_VER = 0.27
MPFR_VER = 4.2.2
# TODO: check if never 6.x kernel headers can be used
LINUX_VER = 5.8.5

# use curl instead of wget
DL_CMD = curl -C - -L -o

# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r47
_buildscriptsver=20170715
_binutilsver=2.28
_gccver=7.1.0
_newlibver=2.5.0
_gdbver=8.0
_generaltoolsver=1.0.0
_islver=0.18
_gbatoolsver=1.0.0
_gp32toolsver=1.0.3
_dstoolsver=1.1.0
_gritver=0.8.14
_ndstoolver=2.0.3
_dlditoolver=1.24.0
_mmutilver=1.8.6
_dfuutilver=0.9.1
_stlinkver=1.2.2
_3dslinkver=0.5.2
_3dstoolsver=1.1.4
_picassover=2.6.2
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development"
arch=('i686' 'x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('freeimage' 'python' 'flex' 'libmpc' 'libusb')
install=devkitarm.install
source=("https://github.com/devkitPro/buildscripts/releases/download/v$_buildscriptsver/buildscripts-$_buildscriptsver.tar.bz2"
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/general-tools-$_generaltoolsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gbatools-$_gbatoolsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gp32tools-$_gp32toolsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/dstools-$_dstoolsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/grit-$_gritver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/ndstool-$_ndstoolver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/dlditool-$_dlditoolver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/mmutil-$_mmutilver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/dfu-util-$_dfuutilver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/stlink-$_stlinkver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/3dslink-$_3dslinkver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/3dstools-$_3dstoolsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/picasso-$_picassover.tar.bz2"
        "devkitarm-skip-libs.patch"
        "devkitarm-add-patches.patch"
        "devkitarm.sh"
        "devkitarm.fish")
sha256sums=('e2bfb7363d1504387e33383416d09b4fc7a5753332eb09890872d3456d5ba3d8'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            '6297433ee120b11b4b0a1c8f3512d7d73501753142ab9e2daa13c5a3edd32a72'
            '8a8136c235f64c6fef69cac0d73a46a1a09bb250776a050aec8f9fc880bebc17'
            '5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b'
            'ae4b7d082fac39895c18c2e55a1b0554f242689577473f4275908868598139cd'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '5e39c58f610410f19312d3fd4380418929912d2173dfa79fb7fe36a192988632'
            '8a376c0c7102753adf69ce3bdc189b306b7df8894181dd515299bd6930b6ed49'
            'd36fce5cc8c8be0c6ba506517ca769ba8311b8a9310c525b20c80131b96251cb'
            '9b60af9f8a462155213d50fe69b670587de60537f5fbb449a09db6418a3ffad6'
            '45fd42cbf95d7d44059748f4af7c94191aff2723a04d249d85fcd60ef3e7dbc3'
            '5ecf67bcd5e2088ad31cd27fa14db575001388abc19510c4297aae42e9cd5d2f'
            '5b9182accb99abc03c1a31c39c003fbc5cb0d4af65a44102ede6098828cd045e'
            'fdcee458cc5ca482810852cfce7fecf2e671d3881c329cd63c6a9030ffa9426e'
            '696127e85fffbfb520ed0f1d8fcc56097f7add88ffc42e70e110032f831ef06f'
            '9b6ada97fd80c4693e5cae77a0376b02cb3964395010f8220468d9b2cd98c475'
            'b54002b86e3a6005a204153d7567876f920a1a5c0a2bc288d95d98189ef0f5e3'
            '48da1407d85e11158e62e39f05b9b10498a40e8aec29206ef5b427bde6742b36'
            '743a744a1939040e779f3c660184bd29dde11998761ca9fd6cde6c0759a5d1d7'
            '4909165bef4458415598165a553d70499926ec49a86b79e49d237aceaf7f709b'
            '9448465b2de6b6aefc5e0a8404f780f737cb86b4b1280d653712271b892908f9'
            'c4cc42b085be7c48f06f75c934e846a61749d9ba5e31ee463a03ba27a01c8afd')
noextract=("binutils-$_binutilsver.tar.bz2" "gcc-$_gccver.tar.bz2"
           "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.bz2"
           "general-tools-$_generaltoolsver.tar.bz2"
           "gbatools-$_gbatoolsver.tar.bz2" "gp32tools-$_gp32toolsver.tar.bz2"
           "dstools-$_dstoolsver.tar.bz2" "grit-$_gritver.tar.bz2"
           "ndstool-$_ndstoolver.tar.bz2" "dlditool-$_dlditoolver.tar.bz2"
           "mmutil-$_mmutilver.tar.bz2" "dfu-util-$_dfuutilver.tar.bz2"
           "stlink-$_stlinkver.tar.bz2" "3dslink-$_3dslinkver.tar.bz2"
           "3dstools-$_3dstoolsver.tar.bz2" "picasso-$_picassover.tar.bz2")

prepare() {
  # reset build dir and force reinstalling already built tools
  rm -rf build
  [ -d buildscripts/.devkitARM ] && find buildscripts/.devkitARM \
    \( -name "installed-*" -o -name "installed" \) -delete

  # generate config file for automatic build
  cat << END > buildscripts/config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=1
BUILD_DKPRO_INSTALLDIR=$PWD/build
BUILD_DKPRO_SRCDIR=$PWD
BUILD_DKPRO_AUTOMATED=1
END

  # fix install of newlib, this is an arch specific bug, that also happens with
  # other arm cross toolchains + newlib. solution is to do the install again.
  sed 's/Error installing newlib"; exit 1; }/newlib, second try"; $MAKE install || { echo "& }/' \
    -i buildscripts/dkarm-eabi/scripts/build-gcc.sh

  # fix search path to use correct tools
  sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i \
    buildscripts/build-devkit.sh

  # use in-tree isl
  # disable guile for gdb
  patch -Np0 < devkitarm-add-patches.patch

  # isl needlessly wants automake-15, upgrading
  autoreconf -Wnone -fi isl-$_islver

  # disable building of libraries, we have separate packages
  patch -Np0 < devkitarm-skip-libs.patch
}

build() {
  cd buildscripts

  # disable conflicting build flags
  unset CPPFLAGS
  ./build-devkit.sh
}

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r build/devkitARM "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/info/*
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
  install -Dm644 devkitarm.fish "$pkgdir"/etc/fish/conf.d/devkitarm.fish
}

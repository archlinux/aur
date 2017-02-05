# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r46
_binutilsver=2.27
_gccver=6.3.0
_newlibver=2.5.0
_gdbver=7.12
_generaltoolsver=1.0.0
_islver=0.16.1
_gbatoolsver=1.0.0
_gp32toolsver=1.0.2
_dstoolsver=1.1.0
_gritver=0.8.14
_ndstoolver=2.0.1
_dlditoolver=1.24.0
_mmutilver=1.8.6
_dfuutilver=0.9.1
_stlinkver=1.2.1
_3dslinkver=0.5.1
_3dstoolsver=1.1.4
_picassover=2.5.0
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development"
arch=('i686' 'x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('freeimage' 'python' 'flex' 'libmpc' 'libusb' 'guile')
install=devkitarm.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20170126.tar.bz2"
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-$_binutilsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gcc-$_gccver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/newlib-$_newlibver.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gdb-$_gdbver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/general-tools-$_generaltoolsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gbatools-$_gbatoolsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gp32tools-$_gp32toolsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dstools-$_dstoolsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/grit-$_gritver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/ndstool-$_ndstoolver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dlditool-$_dlditoolver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/mmutil-$_mmutilver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dfu-util-$_dfuutilver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/stlink-$_stlinkver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/3dslink-$_3dslinkver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/3dstools-$_3dstoolsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/picasso-$_picassover.tar.bz2"
        "devkitarm-skip-libs.patch"
        "devkitarm-use-in-tree-isl.patch"
        "devkitarm.sh"
        "devkitarm.fish")
sha256sums=('6b142f265bc9c7fc9449f5b539198f140d231725b2ed0828749d8a1e0fad73ff'
            '412538bb65c799ac98e17e8cfcdacbb257a57362acfaaff254b0fcae970126d2'
            '369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88'
            'f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f'
            '5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b'
            'dca6461fb6c78a662766d54580737e643b4b6dc43c26a197a8e9d7cb58872de2'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '5e39c58f610410f19312d3fd4380418929912d2173dfa79fb7fe36a192988632'
            '2a4adcd1ea1359fe401fde63384c553513ecc789a3ce1cf61c0d5ed7828edf9f'
            'd36fce5cc8c8be0c6ba506517ca769ba8311b8a9310c525b20c80131b96251cb'
            '9b60af9f8a462155213d50fe69b670587de60537f5fbb449a09db6418a3ffad6'
            '164d41e4499a9079ca7bf3b2feae8dbd3b8a599cc81164e8160462d47f762423'
            '5ecf67bcd5e2088ad31cd27fa14db575001388abc19510c4297aae42e9cd5d2f'
            '5b9182accb99abc03c1a31c39c003fbc5cb0d4af65a44102ede6098828cd045e'
            'fdcee458cc5ca482810852cfce7fecf2e671d3881c329cd63c6a9030ffa9426e'
            'fb8b9cc974849e074a9e8694d62c383ffee6470e17459178de23d215f16bc57a'
            '056bed0a85ad4d044f60a13752d721769fe0631cda0cc6d6831bf30e808f8e95'
            'b54002b86e3a6005a204153d7567876f920a1a5c0a2bc288d95d98189ef0f5e3'
            '2af6d351b8b1d3c107ab31463eca8e73f88f201e580c448bfc71876f4ebe314d'
            '3ba88e36a690f45baf642afbb49bd40e7fc7fb53e3f2eb69b594057cd6071e6d'
            'df823a3344aa91ce8f2fa706c9918f95a99e71e0c65f0d281c8e59cef858280a'
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
  patch -Np0 < devkitarm-use-in-tree-isl.patch
  # isl needlessly wants automake-14, upgrading
  autoreconf -Wnone -fi isl-$_islver

  # update gp32tools
  sed 's/GP32_TOOLS_VER=1.0.1/GP32_TOOLS_VER=1.0.2/' -i buildscripts/build-devkit.sh

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

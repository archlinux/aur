# $Id$
# Maintainer: shmilee <shmilee.zju@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

# last/latest "longterm maintenance" kernel releases
# https://www.kernel.org/category/releases.html
# 5.15 Greg Kroah-Hartman & Sasha Levin 2021-10-31 Oct, 2023
_LLL_VER=5.15
_LLL_SUBVER=11

# Bisect debug, v5.4.47 -> v5.4.48
_Bisect_debug=off # on, test, off
if [ "$_Bisect_debug" == "on" ]; then
  _burlbase=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
  _bcommit=f7757368e0f0b3e108088ca7b5b8abda6faa7ebc #Peter, 8 x
# _bcommit=2e256dd5b05561b051e895121530d2a0062c7a0f #Jann, 10 v
# _bdiff="$_burlbase/diff/?h=linux-${_LLL_VER}.y&id2=v${_LLL_VER}.${_LLL_SUBVER}&id=$_bcommit"
  _bpatch="$_burlbase/rawdiff/?h=linux-${_LLL_VER}.y&id2=v${_LLL_VER}.${_LLL_SUBVER}&id=$_bcommit"
  msg "Bisect debug on: v${_LLL_VER}.${_LLL_SUBVER} --> $_bcommit"
  msg "Bisect debug patch: $_bpatch"
fi

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU can actually run slower with NUMA enabled.
# Most users can disable NUMA.
# see, https://bugs.archlinux.org/task/31187
_NUMA_disable=y

# http://ck.kolivas.org/patches/5.0/
# EOL: https://ck-hack.blogspot.com/2021/08/514-and-future-of-muqss-and-ck-once.html
# xanmod:
#   ck-hrtimer
#   Graysky uarches
#   intel partial Clear Linux patchset
#   lib_zstd
#   lrng framework
_Xan_COMMIT=84e17c462ae855a6d9f9569db2487b427e3a7e66
_Xan_PATCH_SRC="xanmod-$_Xan_COMMIT.tar.gz::https://github.com/xanmod/linux-patches/archive/$_Xan_COMMIT.tar.gz"
_Xan_PATCH_PATCH=()

# Ultra Kernel Samepage Merging
# https://github.com/dolohow/uksm
_UKSM_VER=0.1.2.6
_UKSM_COMMIT=80eb7b0e83af4e0b19eea5529082bfbdd5b4deae
_UKSM_PATCH_SRC="https://gitlab.com/sirlucjan/kernel-patches/-/raw/${_UKSM_COMMIT}/${_LLL_VER}/uksm-patches/0001-UKSM-for-${_LLL_VER}.patch"
_UKSM_PATCH_PATCH=()

# CJKTTY patch 
# https://github.com/Gentoo-zh/linux-cjktty
#_CJKTTY_PATCH_URL="https://github.com/torvalds/linux/compare/v${_LLL_VER}...Gentoo-zh:${_LLL_VER}-utf8.patch"
#_CJKTTY_PATCH_SRC="cjktty-${_LLL_VER}.patch::${_CJKTTY_PATCH_URL}"
# https://github.com/zhmars/cjktty-patches
_CJKTTY_COMMIT=88b6f29be93285221a10ea7d2737f97793754ee4
_CJKTTY_PATCH_SRC="https://github.com/zhmars/cjktty-patches/raw/${_CJKTTY_COMMIT}/v5.x/cjktty-${_LLL_VER}.patch"
_CJKTTY_PATCH_PATCH=()

_PATHSET_DESC="some xanmod patchsets, uksm-${_UKSM_VER} and cjktty"

pkgbase=linux-shmilee
pkgname=("${pkgbase}" "${pkgbase}-headers")
if [ "$_Bisect_debug" == "off" ]; then
  pkgname+=("${pkgbase}-docs")
fi
_srcname=linux-${_LLL_VER}
pkgver=${_LLL_VER}.${_LLL_SUBVER}
pkgrel=1
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(
    'bc' 'kmod' 'libelf' 'pahole' 'cpio' 'perl' 'tar' 'xz'
    'xmlto' 'python-sphinx' 'python-sphinx_rtd_theme' 'graphviz' 'imagemagick')
options=('!strip')
source=(
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.xz"
        #"https://www.kernel.org/pub/linux/kernel/v5.x/patch-${pkgver}.sign"
        ${_Xan_PATCH_SRC}
        ${_Xan_PATCH_PATCH[@]}
        ${_UKSM_PATCH_SRC}
        ${_UKSM_PATCH_PATCH[@]}
        ${_CJKTTY_PATCH_SRC}
        ${_CJKTTY_PATCH_PATCH[@]}
        'config'         # the main kernel config file
)
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman 
)
# https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
sha256sums=('57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8'
            'SKIP'
            'bdb35ece2dd0f6d8225947b63539e70c8fc16bd28f03395d590515d8187f03c4'
            '4f49c13241ad455a77593b927c40704029354f405e56dd0a0bb014b71391524c'
            'cb348cc3ba1a453ac6057ecc08000a2ccddc47b70491caaf71db34a3d630f77c'
            '97a525e28a270c5e6e5a4fc4ab4920c42ceef2f9921857497ab3c56ec343803e'
            'f4d2c31065975e07c37b56b70452be8583a7ab2e5041bfdb93bcd7dfc3f5d0eb')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_kernelname=${pkgbase#linux}

if [ "$_Bisect_debug" != "off" ]; then
  makedepends+=('wget' 'modprobed-db')
  PKGEXT='.pkg.tar'
fi

prepare() {
  cd ${_srcname}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  # add upstream patch
  patch -Np1 -i ../patch-${pkgver}

  # Bisect debug
  if [ "$_Bisect_debug" == "on" ]; then
    msg2 "Patching upstream v$pkgver --> $_bcommit"
    if [ ! -f "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit" ]; then
      wget "$_bpatch" -O "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit"
    fi
    patch -Np1 -i "${srcdir}/../v${pkgver}-${pkgrel}-$_bcommit"
  fi
  # Bisect debug result
  if [ "$_Bisect_debug" != "on" ]; then
    :
  fi

  msg2 "Patching source with some third-party patchsets in xanmod"
  _Xan_patch_dir=../linux-patches-"$_Xan_COMMIT"/"linux-${_LLL_VER}.y-xanmod"
  for p in ${_Xan_PATCH_PATCH[@]}; do
    patch -Ni ../$p -d $_Xan_patch_dir/
  done
  # >>> ck hrtimer patch set, recommends 1000 Hz tick
  scripts/config --enable CONFIG_HZ_1000
  msg2 "Patching with xanmod: CK's high-resolution kernel timers (hrtimer) patchsets ..."
  for i in $_Xan_patch_dir/ck-hrtimer/0*.patch; do
    patch -Np1 -i $i
  done
  msg2 "Patching with xanmod: Graysky's additional CPU optimizations patchsets ..."
  for i in $_Xan_patch_dir/graysky/0*.patch; do
    patch -Np1 -i $i
  done
  msg2 "Patching with xanmod: intel partial Clear Linux patchsets ..."
  for i in $_Xan_patch_dir/intel/0*.patch; do
    patch -Np1 -i $i
  done
  msg2 "Patching with xanmod: ZSTD library for bug fixes and r/w performance patchsets..."
  for i in $_Xan_patch_dir/lib_zstd/0*.patch; do
    patch -Np1 -i $i
  done
  msg2 "Patching with xanmod: Linux Random Number Generator (LRNG) framework patchsets..."
  for i in $_Xan_patch_dir/lrng/0*.patch; do
    patch -Np1 -i $i
  done
  msg2 "Patching with xanmod: BFQ patchsets..."
  for i in $_Xan_patch_dir/xanmod/0*bfq*.patch; do
    patch -Np1 -i $i
  done

  msg2 "Patching source with uksm ${_UKSM_VER} patches"
  cp "../0001-UKSM-for-${_LLL_VER}.patch" "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  for p in ${_UKSM_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"
  done
  patch -Np1 -i "../uksm-${_LLL_VER}.${_LLL_SUBVER}.patch"

  msg2 "Patching source with Gentoo-zh/linux-cjktty patches"
  cp "../cjktty-${_LLL_VER}.patch" "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"
  for p in ${_CJKTTY_PATCH_PATCH[@]}; do
    patch -Ni ../$p "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"
  done
  patch -Np1 -i "../cjktty-${_LLL_VER}.${_LLL_SUBVER}.patch"

  echo "Setting config..."
  cp -Tf ../config .config

  # Optionally disable NUMA for 64-bit kernels only
  if [ -n "$_NUMA_disable" ] && [ "${CARCH}" = "x86_64" ]; then
      msg2 "Disabling NUMA from kernel config..."
      sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
        -i -e '/CONFIG_AMD_NUMA=y/d' \
        -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
        -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
        -i -e '/# CONFIG_NUMA_EMU is not set/d' \
        -i -e '/CONFIG_NODES_SHIFT=6/d' \
        -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
        -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
        -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
        -i -e '/CONFIG_ACPI_NUMA=y/d' .config
  fi

  if [ "$_Bisect_debug" != "off" ]; then
    if [ x"$USER" == x"builduser" ]; then
        SUDO_USER=builduser modprobed-db
        SUDO_USER=builduser modprobed-db store # for makechrootpkg
    fi
    yes "" | make LSMOD=$HOME/.config/modprobed.db localmodconfig
  fi

  # rewrite configuration
  yes "" | make olddefconfig >/dev/null

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  #sed -i '2iexit 0' scripts/depmod.sh

  make -s kernelrelease >version
  msg2 "Prepared $pkgbase version $(<version)"
}

build() {
  cd ${_srcname}

  if [ "$_Bisect_debug" == "off" ]; then
    make ${MAKEFLAGS} all htmldocs
  else
    make ${MAKEFLAGS} all
  fi
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with ${_PATHSET_DESC} patchsets"
  depends=('coreutils' 'kmod' 'mkinitcpio')
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=('VIRTUALBOX-GUEST-MODULES' 'WIREGUARD-MODULE')
  replaces=('virtualbox-guest-modules-arch' 'wireguard-arch')

  cd ${_srcname}
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
  pkgdesc="Documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd ${_srcname}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

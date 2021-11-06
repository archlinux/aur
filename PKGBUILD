# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgbase=linux-t2-wifi
pkgver=5.15
_srcname=linux-${pkgver}
pkgrel=1
pkgdesc="Patched Linux Kernel with support for T2 Mac's and their newer broadcom firmware"
arch=(x86_64)
url="https://github.com/jamlam/mbp-16.1-linux-wifi"
license=('GPL3')
groups=()
depends=()
makedepends=(bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git)
checkdepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
options=('!strip')
source=(
# Linux Kernel
https://www.kernel.org/pub/linux/kernel/v${pkgver//.*}.x/linux-${pkgver}.tar.xz
https://www.kernel.org/pub/linux/kernel/v${pkgver//.*}.x/linux-${pkgver}.tar.sign
# Config File
https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux/trunk/config
#Patches
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/0002-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/2001-drm-amd-display-Force-link_rate-as-LINK_RATE_RBR2-fo.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3001-applesmc-convert-static-structures-to-drvdata.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3002-applesmc-make-io-port-base-addr-dynamic.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3003-applesmc-switch-to-acpi_device-from-platform.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3004-applesmc-key-interface-wrappers.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3005-applesmc-basic-mmio-interface-implementation.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/3006-applesmc-fan-support-on-T2-Macs.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4001-HID-apple-Add-support-for-keyboard-backlight-on-supp.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4002-HID-apple-Add-support-for-MacbookAir8-1-keyboard-tra.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4003-HID-apple-Add-support-for-MacBookPro15-2-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4003-HID-apple-Add-support-for-MacBookPro15-2-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4004-HID-apple-Add-support-for-MacBookPro15-1-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4005-HID-apple-Add-support-for-MacBookPro15-4-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4006-HID-apple-Add-support-for-MacBookPro16-2-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4007-HID-apple-Add-support-for-MacBookPro16-3-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4008-HID-apple-Add-support-for-MacBookAir9-1-keyboard-tra.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/4009-HID-apple-Add-support-for-MacBookPro16-1-keyboard-tr.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/6001-media-uvcvideo-Add-support-for-Apple-T2-attached-iSi.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/7001-drm-i915-fbdev-Discard-BIOS-framebuffers-exceeding-h.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/8001-corellium-wifi-bigsur.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/8002-Add-support-for-BCM4377.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/8003-Add-support-for-BCM4355.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/9001-bluetooth-add-disable-read-tx-power-quirk.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/9002-add-bluetooth-support-for-16,2.patch
https://raw.githubusercontent.com/jamlam/mbp-16.1-linux-wifi/main/intel-lpss.patch
)
sha256sums=(
        '57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8'
        'SKIP'
        'SKIP'
        '1ddd4443470ad66aff8075e0528ad7757de41d474152db1362e23be72e243919'
        '6b4da532421cac5600d09c0c52742aa52d848af098f7853abe60c02e9d0a3752'
        '2184069ab00ef43d9674756e9b7a56d15188bc4494d34425f04ddc779c52acd8'
        '786dfc22e4c6ece883e7dedd0ba3f6c14018584df95450b2cb78f3da8b01f7cb'
        '7366a08383900a09f8e742b1e4f0a02e0839a385e68e70a89d1815c197df3300'
        '8d8401a99a9dfbc41aa2dc5b6a409a19860b1b918465e19de4a4ff18de075ea3'
        '08d165106fe35b68a7b48f216566951a5db0baac19098c015bcc81c5fcba678d'
        '459906cab172df9f6712a4168e7a5d529f85b2bb58a068f2d44746df14a6d27a'
        '2827dab6eeb2d2a08034938024f902846b5813e967a0ea253dc1ea88315da383'
        '398dec7d54c6122ae2263cd5a6d52353800a1a60fd85e52427c372ea9974a625'
        '11565cff9c6a7db8846dc7d5930419045e9527863b8df5979a7465006211bd16'
        '83f4be6849ba4d5f9fad647ad2eb78bf6409ee98a40ac62e8a5b80496233d70a'
        '44bd3643b2b22fedc59d79511199f30ce6759fa0acdd9a66262a53c5e046da6b'
        'eb04a492197783643b3e72b1d0cf0e856290381997bd165a14fbc63ac1489c25'
        '69d56d42473526f7dbd4fb18c5e1baafe4e6d32995b2506bd48ff981c53b5385'
        '1deeacae1875cf9075b858a8bfb2463ebc531c9030b7c2ab46bbb8e4c3b974db'
        '40eff5e88bb30c51c6b97e85c2e7b8dec5f97916f768e6c07618d9c5afe68574'
        'cac035fe07663a319185c644c5b39b34bef89ada348881fa4a02d15290260445'
        '9dfa9f02d17c5cd9620fa2c1d43ca967b81b6a56d33c2bafae14e0c64e498baa'
        '9640178d6251686c980c30fc528b3d70beac6ce8246bf433506a3f843808326c'
        '90a6012cdd8a64ede8e0bbaf7331960bd68f628e0973b65459188eb1ccb5b829'
        '66e91a3c4616a6c1dfaade969c78f8b3799006d208ac5b5ef314589ba684afce'
        '8f5f6321d90a2c4e753d993e5ec5c8ad78ddb4415f5306117b40f40dd9e42af2'
        'e9e564bdd8f45c552c0f1b32ffa142c887f449f9aadcd190f8d7d143c7567259'
        '31e414978a947bdb71f27ed364c4da73b81fcf1921250cb69ee1bcf2bbd25636'
        '57731fa10509eb689649e6d1ea33b2c3e20a8116617bd848b565d42379b2b6b6'
        '22b2695afcc4103743e55ceeda4691a59ddce84a8f16d1d572159dd2ff7f8537'
)
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"
prepare() {
	cd $_srcname

    #Setting version
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    # Applying patches
    local src
    for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  #Setting Config
    echo "Setting Config"
    cp ../config .config
    make olddefconfig

    make -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

}

build() {
	cd $_srcname
	make all
	make htmldocs
}


_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)
  provides=("linux=$pkgver")

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=("linux-headers=$pkgver")

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
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

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

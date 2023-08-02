# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=23.07.1
pkgrel=2
_build_id=202307081612
_ubuntu_ver=23.04.1
pkgdesc="A system restore utility for Linux"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/linuxmint/timeshift"
license=('GPL3')
depends=('cronie' 'gtk3' 'libgee' 'libnotify' 'libsoup' 'rsync' 'vte3' 'which'
         'xapp' 'xorg-xhost')
optdepends=('btrfs-progs: BTRFS support'
            'grub-btrfs: BTRFS snapshots in GRUB')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_amd64.deb")
source_aarch64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_arm64.deb")
source_riscv64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_riscv64.deb")
sha256sums_x86_64=('af483c62a227306c935fc5a35dd08757bb2519be8e773d7dda7d2fd7733a9265')
sha256sums_aarch64=('f5e6915cc80a877428f57d80dad3383c90269a34d31f1073787d6dd3ae4b043c')
sha256sums_riscv64=('93fee40b0108ea6d5b53097d7bfa37b8762975003cee0838453b621e7a9d49f6')

package() {
  bsdtar -xvf data.tar.zst -C "$pkgdir/"
}

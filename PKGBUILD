# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=22.06.5
pkgrel=1
pkgdesc="A system restore utility for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/teejee2008/timeshift"
license=('GPL3')
depends=('cronie' 'gtk3' 'libgee' 'libnotify' 'libsoup' 'rsync' 'vte3' 'xapp'
         'xorg-xhost')
optdepends=('btrfs-progs: BTRFS support'
            'grub-btrfs: BtrfS snapshots in grub')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_amd64.deb")
source_aarch64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_arm64.deb")
sha256sums_x86_64=('4c1424bd692ed5ea1f90fffad1e4cf84869b0cbce8f049a75169a2cd4a687342')
sha256sums_aarch64=('0afef74cd4c098f0f509714ad214c32fe8487f69dce724bc3b040d99b4f5c20f')

package() {
  bsdtar -xvf data.tar.zst -C $pkgdir
}

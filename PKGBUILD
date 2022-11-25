# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=22.11.1
pkgrel=1
pkgdesc="A system restore utility for Linux"
arch=('x86_64')
url="https://github.com/linuxmint/timeshift"
license=('GPL3')
depends=('cronie' 'gtk3' 'libgee' 'libnotify' 'libsoup' 'rsync' 'vte3' 'which'
         'xapp' 'xorg-xhost')
optdepends=('btrfs-progs: BTRFS support'
            'grub-btrfs: BtrfS snapshots in grub')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://launchpadlibrarian.net/635811522/${pkgname%-bin}_${pkgver}-unstable-202211241743~ubuntu23.04.1_amd64.deb")
sha256sums=('c3e3a6be77332f3870ac091fe7c7948d483f2075c2c0da704badda37f2fef2d6')

package() {
  bsdtar -xvf data.tar.zst -C $pkgdir
}

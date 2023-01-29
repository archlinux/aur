# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=22.11.2
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
source=("https://launchpadlibrarian.net/644795277/${pkgname%-bin}_${pkgver}-unstable-202301071604~ubuntu23.04.1_amd64.deb")
sha256sums=('213cfa5db706848b3e9c5c0355113d4064fb3bbe24eac6c9fe5393ed699ebcac')

package() {
  bsdtar -xvf data.tar.zst -C $pkgdir
}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=22.06.1
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
source_x86_64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-0.1_amd64.deb")
source_aarch64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-0.1_arm64.deb")
sha256sums_x86_64=('2999f4fb09e73e1b4dfacc1140681b6e943f4452b6bc7a77c12969ea32c7187d')
sha256sums_aarch64=('d18ebc19529a8f0f8644334e36b7f5730daee4dcdf8e0eba7012c86e022f99d9')

package() {
  bsdtar -xvf data.tar.zst -C $pkgdir
}

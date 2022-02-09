# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=21.09.1
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
sha256sums_x86_64=('4604830442a814ca481a40059486fc629eb85283f663c133b64ba255bd7ca643')
sha256sums_aarch64=('ee8ba8d50351e1ce0290ebc402dd011964e670115de78230e89a113b4f53c1d4')

package() {
  bsdtar -xvf data.tar.xz -C $pkgdir
}

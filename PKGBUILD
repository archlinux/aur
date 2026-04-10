# Maintainer: NFGF <nfgferreira@gmail.com>
# See https://wiki.archlinux.org/title/Creating_packages#Testing_the_PKGBUILD_and_package
# Tested with:
# pacman -Qlp pkgname
# pacman -Qip pkgname
# namcap PKGBUILD
# namcap pkgname.pkg.tar.zst
pkgname=bkp
pkgver=0.1
pkgrel=1
pkgdesc="A simple backup utility written in Go"
arch=('x86_64')
url="https://github.com/nfgferreira/bkp"
depends=('glibc')
license=('GPL-1.0-or-later')
source=("https://github.com/nfgferreira/bkp/releases/download/v0.1/bkp")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/bin
  cp bkp "$pkgdir"/usr/bin
  chmod +x "$pkgdir"/usr/bin/bkp
}


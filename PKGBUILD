# Maintainer: Marco33
pkgname=ggjj
pkgver=0.27.0
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('b9fb076d215b1620d34d0d947a5a332a63b1bc7ff2bfd875e9392c10ecef6666')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}


# Maintainer: Marco33
pkgname=ggjj
pkgver=0.20.0
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('3abb186bd57bb58b3d70089facf7e0996afb4e8af66b253042c31bc364a675e2')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}


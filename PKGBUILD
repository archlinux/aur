# Maintainer: Marco33
pkgname=ggjj
pkgver=0.23.0
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('d0911f57b041044fb0cc7670c32c5646cb01838e25576367732bbc8e7b466d40')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}


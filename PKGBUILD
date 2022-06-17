# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: David Dotson <dotsdl at gmail dot com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Antergos Devs <dev@antergos.com>
# Contributor: dmiranda at gmail dot com
pkgname=numix-frost-themes
pkgver=3.6.6
pkgrel=3
pkgdesc="A modern flat theme with a combination of light and dark elements - Antergos Edition"
arch=('any')
url="https://numixproject.github.io/"
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('gdk-pixbuf2' 'glib2' 'ruby-sass')
source=("https://github.com/Antergos/Numix-Frost/archive/$pkgver.tar.gz")
sha256sums=('8b29ebb6aeb2bb56c0992d90937e9fb30ea955dc7ac2ca57b89aa3c325eeeed1')

build() {
  cd "$srcdir/Numix-Frost-$pkgver"
  make
}

package() {
  cd "$srcdir/Numix-Frost-$pkgver"
  make DESTDIR="$pkgdir" install
}

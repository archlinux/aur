# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Thomas Dziedzic
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>
pkgname=tklib
pkgver=0.7
pkgrel=1
pkgdesc='Tklib specializes in utilities for GUI programming.'
arch=('i686' 'x86_64')
url="https://core.tcl-lang.org/tklib/home"
license=('GPL')
depends=('tk' 'tcllib')
source=(https://github.com/tcltk/tklib/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('1afe81a09c5fad2d9758b88c0250a49fc24c0e337d6d773ad2d622919dafd206')

build() {
  cd $pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr
  make all
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

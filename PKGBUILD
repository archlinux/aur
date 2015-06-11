# Contributor: Bernhard Walle <bernhard@bwalle.de>
pkgname=grabc
pkgver=1.1
pkgrel=4
pkgdesc="A utility for reporting the color of a pixel."
arch=('i686' 'x86_64')
url="http://www.muquit.com/muquit/software/grabc/grabc.html"
license=('GPL')
depends=(libx11)
makedepends=(libx11)
source=(http://www.muquit.com/muquit/software/grabc/$pkgname$pkgver.tar.gz)
md5sums=('d8d308f3183c719309f35c249db4f9ed')
sha512sums=('9a2416fd0cda7bd6fb65092572e6ba932eeac33a8534efe53be8f4bac3576884003dd50075363acd2d8466a406ba8799a0cef51086700269728894913a748aeb')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin/
  cp "$srcdir/$pkgname$pkgver/grabc" $pkgdir/usr/bin/
}

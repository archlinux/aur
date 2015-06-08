# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=random123
pkgver=1.08
pkgrel=1
pkgdesc="counter-based random number generators library"
arch=(any)
url="http://www.deshawresearch.com/resources_random123.html"
license=('BSD')
source=("http://www.deshawresearch.com/downloads/download_random123.cgi/Random123-${pkgver}.tar.gz")
md5sums=('87d2783831c7a95b244868bf754a7f50')

build() {
  cd "$srcdir/Random123-$pkgver"
}

package() {
  cd "$srcdir/Random123-$pkgver"
  install -d "$pkgdir"/usr
  cp -r include "$pkgdir"/usr
}

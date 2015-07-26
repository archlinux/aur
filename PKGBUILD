# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=tegaki-pygtk
pkgver=0.3.1
pkgrel=1
pkgdesc="Base user interface library for Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('python2' 'pygtk>=2.10' 'tegaki-python>=0.2')
makedepends=('python2')
source=("http://www.tegaki.org/releases/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('db7c662482dad10d3d979957edf4b3c2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=$pkgdir/usr --optimize=1
}

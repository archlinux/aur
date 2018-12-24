# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prewikka-updatedb
pkgver=5.0.0
pkgrel=1
pkgdesc="Database updates for graphical front-end analysis console for the Prelude Framework"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
depends=('prewikka')
makedepends=('python2-setuptools')
source=("https://www.prelude-siem.org/pkg/src/5.0.0/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('1f25cca40677ee111950e5776a581232')

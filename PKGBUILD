# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vineyard
pkgver=0.1.4.1.4
pkgrel=1
pkgdesc="Windows programs on Linux, easily"
arch=('any')
url="http://vineyardproject.org/"
license=('LGPL2')
depends=("python2-wine")
source=("https://launchpad.net/vineyard/1.4/1.4.1/+download/vineyard-0.1.4.1.4.tar.gz")
md5sums=('90fbb6b20232000e1af2f9bb43f2e9a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root "${pkgdir}"
}


# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vineyard
pkgver=1.5.1
pkgrel=1
pkgdesc="Windows programs on Linux, easily"
arch=('any')
url="http://vineyardproject.org/"
license=('LGPL2')
source=("https://github.com/Cybolic/vineyard/archive/1.5.1.tar.gz")
md5sums=('d7d1a279525483d27d0645b84a3b6bb5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root "${pkgdir}"
}


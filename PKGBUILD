# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-wine
_pkgname=python-wine
pkgver=0.2.5.5
pkgrel=1
pkgdesc="Python wine bindings"
arch=('any')
url="https://launchpad.net/vineyard"
license=('LGPL2')
depends=("python2" "wine")
source=("https://launchpad.net/vineyard/1.4/1.4.1/+download/python-wine-0.2.5.5.tar.gz")
md5sums=('1231e577a5437f06de98c18adc574f22')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root "${pkgdir}"
}

# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-isort
_pkgname=isort
pkgver=2.1.0
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python python-pies python-natsort)
makedepends=(python-setuptools)
source=("https://github.com/timothycrosley/isort/archive/$pkgver.tar.gz")
sha1sums=('98b3aa02c6aa4baec5955f8a918ce4e3e30e01d5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir/" --optimize=1
}


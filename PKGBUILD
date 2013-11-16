# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-isort
_pkgname=isort
pkgver=2.5.0
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python python-pies python-natsort)
makedepends=(python-setuptools)
source=("https://github.com/timothycrosley/isort/archive/$pkgver.tar.gz")
sha1sums=('d9d1faed976fcad86d8c29c610a61d235fe6f4e5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir/" --optimize=1
}


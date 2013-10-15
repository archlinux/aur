# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-isort
_pkgname=isort
pkgver=2.0.1
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python python-pies python-natsort)
makedepends=(python-setuptools)
source=("https://github.com/timothycrosley/isort/archive/2.0.1.tar.gz")
md5sums=('93e6d6c94f8750646fd92361bcc4962c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir/" --optimize=1
}


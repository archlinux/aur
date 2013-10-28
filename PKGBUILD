# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-natsort
_pkgname=natsort
pkgver=3.0.2
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://github.com/SethMMorton/natsort"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("https://github.com/SethMMorton/natsort/archive/$pkgver.tar.gz")
md5sums=('4394a446fc0db6df7009f1c67154bc59')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir/" --optimize=1
}


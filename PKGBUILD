# Maintainer: Yaron de Leeuw <jdlmail at gmail >
pkgname=python-isort
_pkgname=isort
pkgver=3.7.1
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python python-pies python-natsort)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha1sums=('23bed4317a50b4309070b375bf504b10297839de')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir/" --optimize=1
}


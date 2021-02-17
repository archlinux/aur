# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_supply_drop_shipment
_name=trytond_sale_supply_drop_shipment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale supply drop shipment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8af88a42189f076d161012e3a040cd2005255e8f1338ce8050b31d1740dfe574')
sha512sums=('d46e3859a60c4361f15d2ce32389e9b2173e84a624310ca609af01225035a11f347875e198884f29927b972c0155bc80e7def6715b7bc360e3306f3eea563950')
b2sums=('611a17ae78f0454d6b5c84b6ece87839b9bce6f9e5adf6541e22ac8c9abe8b939ce5c4fc0cb878b73dee6644240e39d61269fc92778586b265e65497f97ba1e7')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

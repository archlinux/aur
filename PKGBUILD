# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_shipment_measurements
_name=trytond_stock_shipment_measurements
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add measurements to shipment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18ced6c2678c509fe1f3146d0ac20bcabbdafe9947d654a99ab7acc8b1463ec2')
sha512sums=('817be98989b81ceee2f40e492233b6bc7825cedf839d02101edc338f87336962e8f06baa82c0a9c43bf7de7e2594bbf6c170cef13a114033ae65a2ddf28b3a27')
b2sums=('b4260867a5d2c362bc9b23cac520a611dd9cf6fb2d142b7c14f346c305b558493bf9e172692396b716db72915b20c329c5610b055c794c37e4f92e021c21b93c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-maxminddb
pkgver=1.4.1
pkgrel=2
pkgdesc='Module for reading MaxMind DB files'
arch=(any)
url=https://maxminddb.readthedocs.io
license=(BSD)
depends=(python libmaxminddb)
makedepends=(python-setuptools)
source=(https://github.com/maxmind/MaxMind-DB-Reader-python/archive/v$pkgver.tar.gz)
md5sums=('b8ead710583b23e82073190f053c5a21')
sha512sums=('94bee89a0ef9d24f937f12f79dc8b9686be46ba3aeedc5538cc0c2ff4379ad2eb0bb84914849d3baa9120d4bbdb3abc215e30efd237a2c6d5fc0161e7e40c0d6')

package() {
  cd MaxMind-DB-Reader-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

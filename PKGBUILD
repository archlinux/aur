# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-geoip2
pkgver=2.9.0
pkgrel=2
pkgdesc='API for GeoIP2 web services and databases'
arch=(any)
url=https://geoip2.readthedocs.org/en/latest/
license=(Apache)
depends=(python-requests
         python-maxminddb)
makedepends=(python-setuptools)
source=(https://pypi.python.org/packages/source/g/geoip2/geoip2-$pkgver.tar.gz)
sha512sums=('0c35f4dfc1ea3b82a5683bb436c344e94fbfc378c6438ef9651a8cd0a8905ffad58e8c67af52058b92694292b43e6c9e4b289627a7e2823e440f36a96470b0d1')

package() {
  cd geoip2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

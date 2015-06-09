# Maintainer: willemw <willemw12@gmail.com>

_pkgname=pywapi
pkgname=python-pywapi
pkgver=0.3.8
pkgrel=2
pkgdesc="Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs"
arch=('any')
#url="https://launchpad.net/python-weather-api"
url="http://code.google.com/p/python-weather-api"
license=('MIT')
depends=('python')
source=(https://launchpad.net/python-weather-api/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('75bf8257f32f2d36169d57d92566cdb1')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


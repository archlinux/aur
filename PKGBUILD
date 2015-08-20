# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=python2-influxdb
pkgver=2.8.0
pkgrel=1
pkgdesc="Python client for InfluxDB"
arch=('any')
url="https://github.com/influxdb/influxdb-python/"
license=('MIT')
depends=('python' 'python2-requests')
optdepends=('influxdb')
options=(!emptydirs)
source=("https://github.com/influxdb/influxdb-python/archive/v$pkgver.tar.gz")
md5sums=('d1b504c6bcfb0e05693088ca37744343')

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

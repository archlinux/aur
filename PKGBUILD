# Maintainer: XavierCLL
pkgname=python-pymodis
pkgver=2.0.4
pkgrel=1
pkgdesc="pyModis is a Free and Open Source Python based library to work with MODIS data"
arch=('any')
url="http://pymodis.fem-environment.eu/"
license=('GPLv2')
depends=('python' 'python-numpy' 'gdal' 'wxpython')
source=("https://github.com/lucadelu/pyModis/archive/$pkgver.tar.gz")
sha256sums=('8f20b2c79336f0699b3a7cfe7808b99af2ded16a8a5e5e8753eee8bf19b000b7')

package() {
  cd "$srcdir/pyModis-$pkgver"

  python setup.py install --install-data="/usr/share/doc/$pkgname" \
    --root="$pkgdir"
}



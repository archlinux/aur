# Maintainer: XavierCLL
pkgname=python-pymodis
pkgver=2.4.0
pkgrel=1
pkgdesc="pyModis is a Free and Open Source Python based library to work with MODIS data"
arch=('any')
url="http://www.pymodis.org"
license=('GPLv2')
depends=('python' 'python-numpy' 'python-gdal' 'python-requests')
source=("https://github.com/lucadelu/pyModis/archive/$pkgver.tar.gz")
sha256sums=('10ac396a0b56c066d56c085b0a6a2001e588277ac9f795f948a7cf583bef2c37')

package() {
  cd "$srcdir/pyModis-$pkgver"

  python setup.py install --install-data="/usr/share/doc/$pkgname" \
    --root="$pkgdir"
}



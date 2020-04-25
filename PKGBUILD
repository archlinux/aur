# Maintainer: XavierCLL
pkgname=python-pymodis
pkgver=2.1.0
pkgrel=1
pkgdesc="pyModis is a Free and Open Source Python based library to work with MODIS data"
arch=('any')
url="http://www.pymodis.org"
license=('GPLv2')
depends=('python' 'python-numpy' 'gdal' 'wxpython')
source=("https://github.com/lucadelu/pyModis/archive/$pkgver.tar.gz")
sha256sums=('493ba114da9b91cd6424cb879ded5aa079939be77d4654fb902b6eabbbbeeb8d')

package() {
  cd "$srcdir/pyModis-$pkgver"

  python setup.py install --install-data="/usr/share/doc/$pkgname" \
    --root="$pkgdir"
}



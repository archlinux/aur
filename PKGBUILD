# Maintainer: XavierCLL
pkgname=python2-pymodis
pkgver=1.0.2
pkgrel=1
pkgdesc="pyModis is a Free and Open Source Python based library to work with MODIS data"
arch=('any')
url="http://pymodis.fem-environment.eu/"
license=('GPLv2')
depends=('python2' 'python2-numpy' 'gdal' 'wxpython')
source=("https://pypi.python.org/packages/source/p/pyModis/pyModis-$pkgver.tar.gz")
sha256sums=('a9210c090db874b23a9b509f3ec4f795c15a3bcb4fe1cd172b5ff06415f3bfc6')

package() {
  cd "$srcdir/pyModis-$pkgver"

  python2 setup.py install --install-data="/usr/share/doc/$pkgname" \
    --root="$pkgdir"
}



# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=python2-pymodis
pkgver=1.0.1
pkgrel=1
pkgdesc="pyModis is a Free and Open Source Python based library to work with MODIS data"
arch=('any')
url="http://pymodis.fem-environment.eu/"
license=('GPLv2')
depends=('python2' 'python2-numpy' 'gdal' 'wxpython')
source=("https://pypi.python.org/packages/source/p/pyModis/pyModis-$pkgver.tar.gz")
sha256sums=('acbdacc9f17c5ea995c5710232edf4b68c1d878a370d309c596509da80461266')

package() {
  cd "$srcdir/pyModis-$pkgver"

  python2 setup.py install --install-data="/usr/share/doc/$pkgname" \
    --root="$pkgdir"
}



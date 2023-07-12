# Maintainer: XavierCLL

pkgname=python-rios
pkgver=1.4.15
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
depends=('python' 'python-numpy' 'gdal')
source=("https://github.com/ubarsc/rios/releases/download/rios-$pkgver/rios-$pkgver.tar.gz")
sha256sums=('71670508dbffcd8f5d24fbb25e6a2b7e1d23b5e899ddc78c90d403bd65981cf4')

build() {
    cd rios-$pkgver
    python setup.py build
}

package() {
    cd rios-$pkgver
    python setup.py install --root="$pkgdir"
}

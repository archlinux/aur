# Maintainer: XavierCLL

pkgname=python-rios
pkgver=1.4.16
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
depends=('python' 'python-numpy' 'gdal')
makedepends=('python-setuptools')
source=("https://github.com/ubarsc/rios/releases/download/rios-$pkgver/rios-$pkgver.tar.gz")
sha256sums=('2f553d85ff4ff26bfda2a8c6bd3d9dcce5ace847f7d9bd2f072c8943f3758ded')

build() {
    cd rios-$pkgver
    python setup.py build
}

package() {
    cd rios-$pkgver
    python setup.py install --root="$pkgdir"
}

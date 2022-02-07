# Maintainer: XavierCLL

pkgname=python-rios
pkgver=1.4.12
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
depends=('python' 'python-numpy' 'gdal')
source=("https://github.com/ubarsc/rios/releases/download/rios-$pkgver/rios-$pkgver.tar.gz")
sha256sums=('6d897488ce1ca77e470483472998afcb2eb3bb3307f392a924b85f88a16d73eb')

build() {
    cd rios-$pkgver
    python setup.py build
}

package() {
    cd rios-$pkgver
    python setup.py install --root="$pkgdir"
}

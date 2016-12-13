# Maintainer: XavierCLL

pkgname=python2-rios
pkgver=1.4.3
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
depends=('python2' 'python2-numpy' 'gdal')
source=("https://bitbucket.org/chchrsc/rios/downloads/rios-$pkgver.tar.gz")
sha256sums=('2dfb4c4712e5182b49e92709d48a0ff79c89a8f1e2199aed9523de6c201600d8')

build() {
    cd rios-$pkgver/
    python2 setup.py build
}

package() {
    cd rios-$pkgver/
    python2 setup.py install --root="$pkgdir"
}

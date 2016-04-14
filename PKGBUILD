# Maintainer: XavierCLL

pkgname=python2-rios
pkgver=1.4.2
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
depends=('python2' 'python2-numpy' 'gdal')
source=("https://bitbucket.org/chchrsc/rios/downloads/rios-$pkgver.tar.gz")
sha256sums=('c99565c74db254aeb8fd3018bd257fa89e48ed8a640461f6e140db6a375f6ec3')

build() {
    cd rios-$pkgver/
    python2 setup.py build
}

package() {
    cd rios-$pkgver/
    python2 setup.py install --root="$pkgdir"
}

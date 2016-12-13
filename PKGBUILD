# Maintainer: XavierCLL

pkgname=python2-rios
pkgver=1.4.3
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
depends=('python2' 'python2-numpy' 'gdal')
source=("https://bitbucket.org/chchrsc/rios/get/rios-$pkgver.tar.bz2")
sha256sums=('af0c424071ef7f8a6be6fee30479babe40dcbd3191632b2c718909f69619c5e6')

build() {
    cd chchrsc-rios*/rios/
    python2 setup.py build
}

package() {
    cd chchrsc-rios*/rios/
    python2 setup.py install --root="$pkgdir"
}

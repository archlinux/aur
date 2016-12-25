# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>

pkgname=descartes
pkgver=1
pkgrel=1
pkgdesc="Use Shapely or GeoJSON-like geometric objects as matplotlib paths and patches."
arch=('x86_64')
url="https://github.com/Toblerity/Shapely"
groups=('descartes')
depends=('python2-shapely')
source=('hg+https://bitbucket.org/sgillies/descartes')
md5sums=('SKIP')

build() {
        cd "$srcdir/${pkgname}"
        python2 setup.py build
}

package() {
        cd "$srcdir/${pkgname}"
        python2 setup.py install --root
}

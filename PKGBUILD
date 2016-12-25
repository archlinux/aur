# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>

pkgname=shapely
pkgver=1.6
pkgrel=1
pkgdesc="Shapely is a BSD-licensed Python package for manipulation and analysis of planar geometric objects."
arch=('x86_64')
url="https://github.com/Toblerity/Shapely"
license=('BSD')
groups=('ipkiss')
depends=('geos')
source=('git+https://github.com/Toblerity/Shapely.git')
md5sums=('SKIP')

build() {
        cd "$srcdir/${pkgname^}"
        python2 setup.py build
}

package() {
        cd "$srcdir/${pkgname^}"
        python2 setup.py install --user
}

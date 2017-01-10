# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python2-jsonxs
pkgver=0.3
pkgrel=1
pkgdesc="A python library that uses path expression strings to get and set values in JSON"
arch=('any')
url="https://github.com/fboender/jsonxs"
license=('MIT')
depends=('python2')
source=("https://github.com/fboender/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b407bd6d449d4d0eefd2ad7b9afada178337dbe4512253cb5b5ece3a6eb602daf88022000dc8555e0e244de926a899c6a2654b7f7c0b6999b3ffb639f21b2e1d')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}


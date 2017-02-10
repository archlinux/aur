# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python2-jsonxs
pkgver=0.3
pkgrel=1
pkgdesc="A python library that uses path expression strings to get and set values in JSON"
arch=('any')
url="https://github.com/fboender/jsonxs"
license=('MIT')
depends=('python2')
source=("https://github.com/fboender/jsonxs/releases/download/${pkgver}/jsonxs-${pkgver}.tar.gz")
sha512sums=('af61e5d25b51b819f191ff2a70c11bbcb34d3a256d4f2744bbd76d88ccda6daf537c97e1822b610a0fca5b9d870839bf497969ec04ce0049dad3171e5ce9d9fb')

build() {
    cd $srcdir/jsonxs-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/jsonxs-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}


# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=python-ago
pkgver=0.0.9
pkgrel=1
pkgdesc="ago: Human readable timedeltas"
url="https://bitbucket.org/russellballestrini/ago/src"
depends=('python' )
makedepends=('python' )
license=('Public Domain')
arch=('any')
source=('https://pypi.python.org/packages/83/1a/17e89f0be2cf69e17fbc96012bd6a2bf6d88a8fd3ac79854cc7007971943/ago-0.0.9.tar.gz')
md5sums=('ebe4555b05151a69c6e3c52dcd155284')

build() {
    cd $srcdir/ago-0.0.9
    python setup.py build
}

package() {
    cd $srcdir/ago-0.0.9
    python setup.py install --root="$pkgdir" --optimize=1
}

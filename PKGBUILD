# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-larch
pkgver=1.20151025
pkgrel=1
pkgdesc="Python copy-on-write B-tree library"
arch=('any')
url="http://liw.fi/larch/"
license=('GPL3')
depends=('python2-tracing')
source=( "http://code.liw.fi/debian/pool/main/p/python-larch/python-larch_$pkgver.orig.tar.xz")
sha256sums=('8df3f2f48070a67b7cc1852a8dde998219357e58259db905419b566feca52d44')

build() {
    cd "$srcdir/python-larch-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-larch-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-larch
pkgver=1.20131130
pkgrel=1
pkgdesc="Python copy-on-write B-tree library"
arch=('any')
url="http://liw.fi/larch/"
license=('GPL3')
depends=('python2-tracing')
source=( "http://code.liw.fi/debian/pool/main/p/python-larch/python-larch_$pkgver.orig.tar.gz")
sha256sums=('2717e851bde45b66e8b2d44181861f24135d185abab8111119857943d3b5cac1')

build() {
    cd "$srcdir/larch-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/larch-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

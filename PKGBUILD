# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-ttystatus
pkgver=0.35
pkgrel=1
pkgdesc="Library for showing progress reporting and status updates on terminals"
arch=('any')
url="http://liw.fi/ttystatus/"
license=('GPL3')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-ttystatus/python-ttystatus_$pkgver.orig.tar.xz")
sha256sums=('317120cbee8c45b459d32f9c887aee51cd0fe1a26732c87a97ae904a1af005fc')

build() {
    cd "$srcdir/python-ttystatus-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-ttystatus-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

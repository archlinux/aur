# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-ttystatus
pkgver=0.23
pkgrel=2
pkgdesc="Library for showing progress reporting and status updates on terminals"
arch=('any')
url="http://liw.fi/ttystatus/"
license=('GPL3')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-ttystatus/python-ttystatus_$pkgver.orig.tar.gz")
sha256sums=('1ecd58dff0049fdccedb6cd41ff0ddc51971c943e8d1887f8c027ae9e3aeb17a')

build() {
    cd "$srcdir/ttystatus-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/ttystatus-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=python2-ttystatus
pkgver=0.32
pkgrel=2
pkgdesc="Library for showing progress reporting and status updates on terminals"
arch=('any')
url="http://liw.fi/ttystatus/"
license=('GPL3')
depends=('python2')
source=("http://code.liw.fi/debian/pool/main/p/python-ttystatus/python-ttystatus_$pkgver.orig.tar.xz")
sha256sums=('8580b9b63939b319bcebdf314e3c029e87602c82c483bc851d5e5037d5b28df8')

build() {
    cd "$srcdir/python-ttystatus-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-ttystatus-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

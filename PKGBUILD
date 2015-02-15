# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python2-flanker
pkgver=0.4.27
pkgrel=1
_libname=flanker
pkgdesc='Mailgun Parsing Tools'
url='https://pypi.python.org/pypi/flanker'
depends=('python2')
optdepends=('python2-regex: for flanker.mime'
            'python2-paste: for flanker.mime'
            'python2-redis: for flanker.mime'
            'python2-dnsq: for flanker.mime')
license=('Apache2')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

sha256sums=('9f4d7e565fc50599c1912d1df2060c5a5f8918c823935fbc6681bf2ddde8ed4f')

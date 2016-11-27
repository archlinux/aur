# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=python2-gpsoauth
_pkgname=gpsoauth
pkgver=0.4.0
pkgrel=2
pkgdesc="A python client library for Google Play Services OAuth."
arch=('any')
url="https://github.com/simon-weber/gpsoauth"
license=('MIT')
depends=('python2-pycryptodomex>=3.0' 'python2-requests')
makedepends=('python2-setuptools')
source=("https://github.com/simon-weber/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('f9b17147ab28aa4e7b7831b86affebf2')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

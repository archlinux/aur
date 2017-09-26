# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=python-sslib
pkgver=0.2.0
pkgrel=2
pkgdesc="A Python3 library for sharing secrets"
arch=("any")
url="https://github.com/jqueiroz/python-sslib"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
options=("!emptydirs")
source=("https://github.com/jqueiroz/python-sslib/archive/v$pkgver.tar.gz")
sha512sums=("596dc9a7c3b5ca4c301aeae98c56a7df653f08b22e89e93482a1b96796637ef7b9270d5400b495a0fd743c50954cd0939f18f0d80cfb2f2fc56479424b203947")

package() {
    cd "$srcdir/python-sslib-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

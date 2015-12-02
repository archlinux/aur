# Maintainer: Armin Fisslthaler <armin@fisslthaler.net>
pkgname=python3-simplepam
pkgver=0.1.5
pkgrel=1
pkgdesc="Pure Python interface to the Pluggable Authentication Modules system on Linux"
arch=('any')
url="https://github.com/leonnnn/python3-simplepam"
license=('MIT')
depends=('pam' 'python3')
source=(https://github.com/leonnnn/python3-simplepam/archive/$pkgver.tar.gz)
md5sums=('d2213c1b2d28e1c67d77af29b05ddc69')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}


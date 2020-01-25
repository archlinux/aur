# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-captcha
pkgver=0.3
pkgrel=1
pkgdesc='A captcha library that generates audio and image CAPTCHAs.'
arch=('any')
url='https://github.com/lepture/captcha'
license=('BSD')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e12430461a122ba2d0b7dc288865ceff41512b810653a4405b80af9e21c6a0d')

package() {
    cd "$srcdir/captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

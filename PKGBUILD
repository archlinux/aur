# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-captcha
pkgver=0.4
pkgrel=1
pkgdesc='A captcha library that generates audio and image CAPTCHAs.'
arch=('any')
url='https://github.com/lepture/captcha'
license=('BSD')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2f8f90d0451a7f5efe1eb60d29a6b82115860e3cedff758e26ae1481f0a86b14')

package() {
    cd "$srcdir/captcha-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

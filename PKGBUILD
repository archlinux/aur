# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.2.5
pkgrel=1
pkgdesc="Generate secure multiword passwords/passphrases, inspired by XKCD"
arch=('any')
url="https://github.com/redacted/XKCD-password-generator"
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=()
options=(!emptydirs)
source=("https://github.com/redacted/XKCD-password-generator/archive/$pkgname-$pkgver.tar.gz")
md5sums=('09a01e430099fc853ef910398f4558be')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.4.0
pkgrel=1
pkgdesc="Generate secure multiword passwords/passphrases, inspired by XKCD"
arch=('any')
url="https://github.com/redacted/XKCD-password-generator"
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=()
options=(!emptydirs)
source=("https://github.com/redacted/XKCD-password-generator/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('235113f0be798a9fe43370ee64dbfce75bfaccbdd832c253f3921c0f8a9f3628')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.6.3
pkgrel=1
pkgdesc="Generate secure multiword passwords/passphrases, inspired by XKCD"
arch=('any')
url="https://github.com/redacted/XKCD-password-generator"
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=()
options=(!emptydirs)
source=("https://github.com/redacted/XKCD-password-generator/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('251aa6de759f467a2a17ea86702718963dcec67703ca83405518fd2e7518f062')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

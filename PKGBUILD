# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=xkcdpass
_pkgname=XKCD-password-generator-xkcdpass
pkgver=1.4.2
pkgrel=1
pkgdesc="Generate secure multiword passwords/passphrases, inspired by XKCD"
arch=('any')
url="https://github.com/redacted/XKCD-password-generator"
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=()
options=(!emptydirs)
source=("https://github.com/redacted/XKCD-password-generator/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('afb4fbfe3f025d63336384814cff34aa3000ed8ff32ad50382457bee84948c0e')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

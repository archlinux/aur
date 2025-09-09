# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-email-reply-parser
_name=${pkgname#python-}
pkgver=0.5.12
pkgrel=1
pkgdesc="Email reply parser library for Python"
arch=(any)
url="https://github.com/zapier/email-reply-parser"
license=(MIT)
groups=()
depends=(python)
makedepends=(python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/ed/f9/3fbd22530467a831a0506267477c5005d24661d07abf776678ab42d51b35/email_reply_parser-$pkgver.tar.gz")
sha256sums=('9dbf3eca69990932234f09e7f50aa73756574fc1f88e88c324fec1a741ee6a74')

build() {
    cd "$srcdir/email_reply_parser-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/email_reply_parser-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
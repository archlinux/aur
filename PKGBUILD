# Maintainer: Stephanie (@tildesilly) <steph@sirenhead.gay>
pkgname=impala-aur-helper
pkgver=1.0.beta1
pkgrel=1
pkgdesc="Intelligent Manager for Packages, AUR, and Local Archives - A user-friendly AUR helper written in Python."
arch=('any')
depends=('git' 'python')
makedepends=('python-pip')
source=(https://github.com/tildes1lly/IMPALA/archive/refs/tags/v1.0.beta1.tar.gz)
sha256sums=('941c0477a5efc2ec61af44ce73c98adbe1490b292ddb7a260990157818dcf48d')
package() {
    cd "$srcdir/IMPALA-1.0.beta1"
    pip install --root="$pkgdir" --prefix=/usr .
}
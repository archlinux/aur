# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.3
pkgrel=1
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://github.com/huboles/aursh"
license=('GPL')
groups=('aursh')
depends=('bash' 'git' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/testing/$pkgname-$pkgver.tar.gz")
install=aursh.install
BUILDENV+=('!check')
package() {
    cd "$pkgname-$pkgver" || exit
    make install DESTDIR="$srcdir/" 
}
sha256sums=('dbc00e6088daca0e06d43d2645f128f83c1762944e47f313c3084eefdb23754d')

# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://github.com/huboles/aursh"
license=('GPL')
groups=('aursh')
depends=('bash' 'git' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
package() {
    cd "$srcdir" || exit
    make install DESTDIR="$pkgdir" 
}
sha256sums=('236c7b04b9678371df0610d4e0e0e1582c8c03efeccbb86a72c70c205d4250de')

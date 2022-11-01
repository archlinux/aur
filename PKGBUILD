# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.4.0
pkgrel=4
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://github.com/huboles/aursh"
license=('GPL')
groups=('aursh')
depends=('bash' 'git' 'curl' 'jq')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
package() {
    cd "$srcdir" || exit
    make install DESTDIR="$pkgdir" 
}
sha256sums=('32e259b070d52c4e3e2ca3d59928715524f2174690984780023663df81aa74a1')

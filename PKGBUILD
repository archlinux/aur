# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple AUR helper written in bash"
arch=('any')
url="https://github.com/huboles/aursh"
license=('GPL')
groups=('aursh')
depends=('bash' 'git' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
install=aursh.install
BUILDENV+=('!check')
package() {
    cd "$srcdir" || exit
    make install DESTDIR="$pkgdir/" 
}
sha256sums=('07b3c5f2c2eb45c4d4cac702667efe81b33544b10054b5cdac559ad5c7d7a64b')

# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.1
pkgrel=2
pkgdesc="A simple cli package manager for the AUR written in bash"
arch=('x86_64')
url="https://github.com/huboles/aursh/releases/download/testing"
license=('GPL')
depends=('git' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
sha256sums=('03666473826011810880beaee7aff3bcf6b821f7a06599951fb02ebf28aab65f')

package() {
	cd "$srcdir" || exit
    install -Dm755 aur.sh "$pkgdir/usr/bin/aursh"
    install -Dm644 aursh.conf "$pkgdir/usr/share/$pkgname/aursh.conf"
}

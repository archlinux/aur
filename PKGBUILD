# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=aursh
pkgver=0.4.0
pkgrel=5
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
sha256sums=('10dbbe4d90085c5f6f776bbec2ff0f69eb76b5394ad19d1af6aac3a0c3f67fe2')

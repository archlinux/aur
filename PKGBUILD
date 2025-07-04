# Maintainer: Marcus Ziade <your-email@example.com>
pkgname=starcraft-cli
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-line tool for tracking StarCraft 2 esports"
arch=('x86_64')
url="https://github.com/marcusziade/StarCraftKit"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusziade/StarCraftKit/releases/download/$pkgver/starcraft-cli-linux.tar.gz")
sha256sums=('c508b439f47530a1466f1f65198069e2ce890acfe3ac3279fa017ed4d450dd93')

package() {
    cd "$srcdir"
    install -Dm755 starcraft-cli "$pkgdir/usr/bin/starcraft-cli"
}
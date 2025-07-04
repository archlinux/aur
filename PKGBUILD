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
sha256sums=('38988096deddd680405d9feb0b37acc395c1a162202ba16f2c2b2a8887bd5eb6')

package() {
    cd "$srcdir"
    install -Dm755 starcraft-cli "$pkgdir/usr/bin/starcraft-cli"
}
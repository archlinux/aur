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
sha256sums=('779c284af32db630c7b6cfcf9ff643935919c01ed494741d9cab275acad18815')

package() {
    cd "$srcdir"
    install -Dm755 starcraft-cli "$pkgdir/usr/bin/starcraft-cli"
}
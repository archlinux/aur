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
sha256sums=('aca263217d5fed300e4c7bea4dc721e69bd142068210ac4642351b1cc4223da9')

package() {
    cd "$srcdir"
    install -Dm755 starcraft-cli "$pkgdir/usr/bin/starcraft-cli"
}
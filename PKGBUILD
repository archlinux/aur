# Maintainer: byteowlz
pkgname=mmry
pkgver=0.9.0
pkgrel=1
pkgdesc="A lean, local-first memory management system for humans and AI agents"
arch=('x86_64')
url="https://github.com/byteowlz/mmry"
license=('MIT')
depends=('gcc-libs')
conflicts=('mmry-cuda')
provides=('mmry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/mmry/releases/download/v$pkgver/mmry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b85c942d740435f524f65615d6b98781ca597c71a9e6f17c9212b98f9b293682')

package() {
    install -Dm755 mmry "$pkgdir/usr/bin/mmry"
    install -Dm755 mmry-mcp "$pkgdir/usr/bin/mmry-mcp"
    install -Dm755 mmry-tui "$pkgdir/usr/bin/mmry-tui"
    install -Dm755 mmry-service "$pkgdir/usr/bin/mmry-service"
}

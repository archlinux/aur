# Maintainer: byteowlz
pkgname=mmry
pkgver=0.7.1
pkgrel=1
pkgdesc="A lean, local-first memory management system for humans and AI agents"
arch=('x86_64')
url="https://github.com/byteowlz/mmry"
license=('MIT')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/mmry/releases/download/v$pkgver/mmry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('db12e4f7a14dc49085deb154dc5025f8ec46f07dd25acd8d3c9bbb9a70ae47a6')

package() {
    install -Dm755 mmry "$pkgdir/usr/bin/mmry"
    install -Dm755 mmry-mcp "$pkgdir/usr/bin/mmry-mcp"
    install -Dm755 mmry-tui "$pkgdir/usr/bin/mmry-tui"
    install -Dm755 mmry-service "$pkgdir/usr/bin/mmry-service"
}

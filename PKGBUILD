# Maintainer: byteowlz
pkgname=mmry
pkgver=0.12.0
pkgrel=1
pkgdesc="A lean, local-first memory management system for humans and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/mmry"
license=('MIT')
depends=('gcc-libs')
conflicts=('mmry-cuda')
provides=('mmry')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/byteowlz/mmry/releases/download/v$pkgver/mmry-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/byteowlz/mmry/releases/download/v$pkgver/mmry-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7dcd7222f82fa8940b0ce21a736710288cfa939959222db2aa4c7ae94f621ceb')
sha256sums_aarch64=('23978a1e46ccad91f7315218a72e17404cd27c4bfc534d2dff3da2da73a1af12')

package() {
    install -Dm755 mmry "$pkgdir/usr/bin/mmry"
    install -Dm755 mmry-mcp "$pkgdir/usr/bin/mmry-mcp"
    install -Dm755 mmry-tui "$pkgdir/usr/bin/mmry-tui"
    install -Dm755 mmry-service "$pkgdir/usr/bin/mmry-service"
}

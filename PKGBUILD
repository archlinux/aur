# Maintainer: byteowlz
pkgname=mmry
pkgver=0.10.3
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
sha256sums_x86_64=('f0b347a66b377ef255d68a75226e61a6d8b46f5af833bb956926de1431f7872e')
sha256sums_aarch64=('2a550eea0760a8d7824b7865897a8f2850767a7b0401dee13f1cc74374631f6e')

package() {
    install -Dm755 mmry "$pkgdir/usr/bin/mmry"
    install -Dm755 mmry-mcp "$pkgdir/usr/bin/mmry-mcp"
    install -Dm755 mmry-tui "$pkgdir/usr/bin/mmry-tui"
    install -Dm755 mmry-service "$pkgdir/usr/bin/mmry-service"
}

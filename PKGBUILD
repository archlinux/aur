# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=pgtidy-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="PostgreSQL SQL formatter and linter"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/pgtidy"
license=('MIT')
provides=('pgtidy')
conflicts=('pgtidy')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9a0cbaa00833721243eacda2a46fe0a5a1141831875260da20abd38f10debd72')
sha256sums_aarch64=('a2191971f8892dcadd8d5b79764c314878e57e3300d4e24dcac2c9a18e7ef8be')

package() {
    install -Dm755 "pgtidy" "$pkgdir/usr/bin/pgtidy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

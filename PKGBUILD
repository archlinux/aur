# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=pgtidy-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="PostgreSQL SQL formatter and linter"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/pgtidy"
license=('MIT')
provides=('pgtidy')
conflicts=('pgtidy')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2f9cd1ae9c927e8ac62bf725ff9e6325180347dee194fc10655ccd5520a2e1bd')
sha256sums_aarch64=('25d9819e652b8624719c8128fc51b723e0bc1f51c2a4ff1dcdb8e3c471cf4b54')

package() {
    install -Dm755 "pgtidy" "$pkgdir/usr/bin/pgtidy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

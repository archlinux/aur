# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=vacuum-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="An ultra-super-fast, lightweight OpenAPI linter and quality checking tool, written in golang and inspired by Spectral."
arch=('x86_64')
provides=('vacuum')
conflicts=('vacuum')
url="https://github.com/daveshanley/vacuum"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daveshanley/vacuum/releases/download/v${pkgver}/vacuum_${pkgver}_linux_x86_64.tar.gz")
sha512sums=('65ded4fd9a186a3eaf85f1a6632599d0ab0880685553be6edf9f73d83ad3a573bfccb7d4346f40158b8fbfab5cccd04c06b63b114caf5edc5378daaf844250c0')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 vacuum "$pkgdir/usr/bin/vacuum"
}

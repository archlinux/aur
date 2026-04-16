# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=vacuum-bin
pkgver=0.25.9
pkgrel=1
pkgdesc="An ultra-super-fast, lightweight OpenAPI linter and quality checking tool, written in golang and inspired by Spectral."
arch=('x86_64')
provides=('vacuum')
conflicts=('vacuum')
url="https://github.com/daveshanley/vacuum"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daveshanley/vacuum/releases/download/v${pkgver}/vacuum_${pkgver}_linux_x86_64.tar.gz")
sha512sums=('fe7466ae421eb0b1a52c513390c8693c216b29eba5b6b6ba79262e255a16761888563595140eccebcf98e140a8f74d39ef2cf7a41fe6f6bf6511fd4c47bad630')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 vacuum "$pkgdir/usr/bin/vacuum"
}

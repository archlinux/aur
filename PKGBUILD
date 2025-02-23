# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=vacuum-bin
pkgver=0.16.3
pkgrel=1
pkgdesc="An ultra-super-fast, lightweight OpenAPI linter and quality checking tool, written in golang and inspired by Spectral."
arch=('x86_64')
provides=('vacuum')
conflicts=('vacuum')
url="https://github.com/daveshanley/vacuum"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daveshanley/vacuum/releases/download/v${pkgver}/vacuum_${pkgver}_linux_x86_64.tar.gz")
sha512sums=('104979c61c08e69c70946fcbdf94a63be2a4467a51d9576824352908c2696ee9591d638fd2890c7ae79ed2e4f8b495e481ecb9f5429885d77e22d9a498b19a48')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 vacuum "$pkgdir/usr/bin/vacuum"
}

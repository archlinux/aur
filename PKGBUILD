# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=vacuum-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="An ultra-super-fast, lightweight OpenAPI linter and quality checking tool, written in golang and inspired by Spectral."
arch=('x86_64')
provides=('vacuum')
conflicts=('vacuum')
url="https://github.com/daveshanley/vacuum"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daveshanley/vacuum/releases/download/v${pkgver}/vacuum_${pkgver}_linux_x86_64.tar.gz")
sha512sums=('01abbdcba8d84b573639e30c4c0f6626d03b988ddf2010f1c5bc9ded7036155920b6f93ab9d14e5b8e52643186bbe7bbc345f78c2e8984d07dfdb7d4a676ab82')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 vacuum "$pkgdir/usr/bin/vacuum"
}

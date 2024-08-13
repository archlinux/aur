# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=vacuum-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="An ultra-super-fast, lightweight OpenAPI linter and quality checking tool, written in golang and inspired by Spectral."
arch=('x86_64')
provides=('vacuum')
conflicts=('vacuum')
url="https://github.com/daveshanley/vacuum"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daveshanley/vacuum/releases/download/v${pkgver}/vacuum_${pkgver}_linux_x86_64.tar.gz")
sha512sums=('dd061d0aee0e9d90bbe2b2532a87edac2d3b1ed2b19f5ff4d55853c717807d01880c841c7bc858b8bd1b9e35ea821aabc95b90636b346e9e3846f17f03a942f0')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 vacuum "$pkgdir/usr/bin/vacuum"
}

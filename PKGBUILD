# Maintainer: DODOEX <maintainers@dodoex.io>

pkgname=chainpilot-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI tool for on-chain DeFi operations on EVM-compatible networks"
arch=('x86_64')
url="https://github.com/DODOEX/ChainPilot"
license=('MIT')
provides=('chainpilot')
conflicts=('chainpilot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/chainpilot-linux-x86_64.tar.gz")
sha256sums=('b688842f46dc67f2e728549926a11d5d86f83e44ab8b5aa6b8b1c24c37139e79')

package() {
  install -Dm755 "$srcdir/chainpilot-linux-x86_64/chainpilot" "$pkgdir/usr/bin/chainpilot"
}

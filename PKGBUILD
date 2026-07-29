# Maintainer: DODOEX <maintainers@dodoex.io>

pkgname=chainpilot-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="CLI tool for on-chain DeFi operations on EVM-compatible networks"
url="https://github.com/DODOEX/ChainPilot"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DODOEX/ChainPilot/releases/download/v$pkgver/chainpilot-linux-x86_64.tar.gz")
arch=('x86_64')
license=('MIT')
provides=('chainpilot')
conflicts=('chainpilot')
sha256sums=('a919c4ceaabea04b5c4d93465ce0a8eadbf2a2c99da43c8c7ab62121904b6b33')

package() {
  install -Dm755 "$srcdir/chainpilot-linux-x86_64/chainpilot" "$pkgdir/usr/bin/chainpilot"
}

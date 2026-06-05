# Maintainer: DODOEX <maintainers@dodoex.io>

pkgname=chainpilot-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI tool for on-chain DeFi operations on EVM-compatible networks"
url="https://github.com/DODOEX/ChainPilot"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DODOEX/ChainPilot/releases/download/v$pkgver/chainpilot-linux-x86_64.tar.gz")
arch=('x86_64')
license=('MIT')
provides=('chainpilot')
conflicts=('chainpilot')
sha256sums=('331fa10482d5dc8287a90a71745e3f5ec97a94fc6c4bc2b6ed555976b90d80a6')

package() {
  install -Dm755 "$srcdir/chainpilot-linux-x86_64/chainpilot" "$pkgdir/usr/bin/chainpilot"
}

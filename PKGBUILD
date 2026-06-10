# Maintainer: DODOEX <maintainers@dodoex.io>

pkgname=chainpilot-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool for on-chain DeFi operations on EVM-compatible networks"
url="https://github.com/DODOEX/ChainPilot"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DODOEX/ChainPilot/releases/download/v$pkgver/chainpilot-linux-x86_64.tar.gz")
arch=('x86_64')
license=('MIT')
provides=('chainpilot')
conflicts=('chainpilot')
sha256sums=('5c2f9ff3d5a85ca9c980fcc2ae8e97a97533702738d291d7ba315695f2c6260b')

package() {
  install -Dm755 "$srcdir/chainpilot-linux-x86_64/chainpilot" "$pkgdir/usr/bin/chainpilot"
}

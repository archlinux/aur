# Maintainer: DODOEX <maintainers@dodoex.io>

pkgname=chainpilot-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="CLI tool for on-chain DeFi operations on EVM-compatible networks"
url="https://github.com/DODOEX/ChainPilot"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DODOEX/ChainPilot/releases/download/v$pkgver/chainpilot-linux-x86_64.tar.gz")
arch=('x86_64')
license=('MIT')
provides=('chainpilot')
conflicts=('chainpilot')
sha256sums=('e0e9a21e1295229ea9a07758affdd84305f45e0dcd3c22474f53e4902f8a0c8d')

package() {
  install -Dm755 "$srcdir/chainpilot-linux-x86_64/chainpilot" "$pkgdir/usr/bin/chainpilot"
}

# Maintainer: DODOEX <maintainers@dodoex.io>

pkgname=chainpilot-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI tool for on-chain DeFi operations on EVM-compatible networks"
url="https://github.com/DODOEX/ChainPilot"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DODOEX/ChainPilot/releases/download/v$pkgver/chainpilot-linux-x86_64.tar.gz")
arch=('x86_64')
license=('MIT')
provides=('chainpilot')
conflicts=('chainpilot')
sha256sums=('0e18bfa87f4e12068fc0ecbddcd0b869206774cc63b68d3f6fdb3a049e0bb6d2')

package() {
  install -Dm755 "$srcdir/chainpilot-linux-x86_64/chainpilot" "$pkgdir/usr/bin/chainpilot"
}

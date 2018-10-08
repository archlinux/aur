# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=ethminer-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)"
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
provides=('ethminer')
conflicts=('ethminer')
source=("https://github.com/ethereum-mining/ethminer/releases/download/v${pkgver}/ethminer-${pkgver}-linux-x86_64.tar.gz")
md5sums=('84171f933d673d5eb351700d52cd05c4')

package() {
  install -Dm755 "$srcdir/bin/ethminer" "$pkgdir/usr/bin/ethminer"
}

# vim:set ts=2 sw=2 et:

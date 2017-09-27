# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=ethminer-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)"
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
provides=('ethminer')
conflicts=('ethminer')
source=("https://github.com/ethereum-mining/ethminer/releases/download/v${pkgver}/ethminer-${pkgver}-Linux.tar.gz")
md5sums=('f149b051e2cd6741a669f485e928476a')

package() {
  install -Dm755 "$srcdir/bin/ethminer" "$pkgdir/usr/bin/ethminer"
}

# vim:set ts=2 sw=2 et:

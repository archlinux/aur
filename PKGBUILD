# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=ethminer-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support (precompiled binary)"
arch=('x86_64')
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
provides=('ethminer')
conflicts=('ethminer')
source=("https://github.com/ethereum-mining/ethminer/releases/download/v${pkgver}/ethminer-${pkgver}-Linux.tar.gz")
md5sums=('945c54be9bbcb2d9bf01859aa9a16e5e')

package() {
  install -Dm755 "$srcdir/bin/ethminer" "$pkgdir/usr/bin/ethminer"
}

# vim:set ts=2 sw=2 et:

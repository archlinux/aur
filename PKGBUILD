# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.36.0
pkgrel=1
_pkgver_suffix=186
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('fcd08ec5b34ceaf51b197ce0e8c1e4c442812957044641ef1b379eb925b5186e')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

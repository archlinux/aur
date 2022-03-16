# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.42.1
pkgrel=1
_pkgver_suffix=206
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('d3bdf2ef87383a79358acaab9130b523b0adfed11697aa7d72a9924df78f9969')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

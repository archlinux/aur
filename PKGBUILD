# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.38.0
pkgrel=1
_pkgver_suffix=189
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('fd3497c82141ef79f4060f826bd49a6560337a1fe5880b0ad67c56458a2f31c1')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

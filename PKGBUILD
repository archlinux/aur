# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.33.1
pkgrel=1
_pkgver_suffix=157
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('6779fc4e2823be6bfb7ad4463187c3a4e4a8bb01939afa39111e661b134c53ae')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

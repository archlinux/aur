# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.52.1
pkgrel=1
_pkgver_suffix=266
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('3b51cde3140fbcd3616d9bc828cbc48b21202e9de616f48e9ae5008e95b9479e')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

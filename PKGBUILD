# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.27.1
pkgrel=2
_pkgver_suffix=124
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('b308ae6942233edeb89b644cefdeb9119d99fc1d6175744c097ffa19b49c1682')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.55.4
pkgrel=1
_pkgver_suffix=404
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('8366b684e70afa756ee27c1065467d6951c058c7deab74c1b8994d963c6bc723')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

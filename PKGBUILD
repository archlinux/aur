# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.48.2
pkgrel=1
_pkgver_suffix=250
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('a8142aaeecce9971d23e95ae06d0c048ddad82577b71797908be584aecb5ac36')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

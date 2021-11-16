# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.34.1
pkgrel=1
_pkgver_suffix=172
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('0163d2ae5f36d69d7d546636707c18b1e4d8e75be96acce1309e647a7f9f517c')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

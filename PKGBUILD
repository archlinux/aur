# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.55.3
pkgrel=1
_pkgver_suffix=296
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('935f42a02bf6e75a5cd72bacb64d7b1d401d3d3fded046781e050ee0b6d3d562')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

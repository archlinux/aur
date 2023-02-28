# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.66.2
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver.rpm")
sha256sums=('f6b4a14b41583efd68fccee0258d08a5b4bc8c602ff510c65ba729f547d4d965')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

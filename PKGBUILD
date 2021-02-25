# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.26.5
pkgrel=2
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-116.rpm")
sha256sums=('4e6e3aabe764b28cdc2edc08ef83e3c60c5fe13054699eed8cc0bea8fb58c13c')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

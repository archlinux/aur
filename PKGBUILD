# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.66.4
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver.rpm")
sha256sums=('941a51e2a62060e8f4c845e1a9dcdeed061e5469b79a9b1340e4188748e8be33')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.68.7
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver.rpm")
sha256sums=('cbba424dba55ff984704e120e15d41a94b79366d605ccf6efd60c0a147050061')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

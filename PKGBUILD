# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.67.3
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver.rpm")
sha256sums=('11183647c44621e7ed3e1451651e84ce94beb21bf68864a311988fb4a5fe73d7')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

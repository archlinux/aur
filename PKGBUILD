# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.89.8
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('7db83caf809c10bf745e25f6297e0ee964c3cfea7222e771d6185877b7269fe9')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

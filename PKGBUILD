# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.91.16
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('38c8d8b8e5679e8b7f51d40b4ebe219b288d2476db5f41ec6a12fca325a11564')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

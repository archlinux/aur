# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.91.5
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('9af3245fdcf6c50c673a1d6d3e49a633db818ac2157d0110659edc84dc4b2e53')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

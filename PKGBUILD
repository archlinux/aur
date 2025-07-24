# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.91.14
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('435d4232c7964dece045b6079f0247d1077e326a777415695e74b37d8510297c')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

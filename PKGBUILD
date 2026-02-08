# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.98.3
pkgrel=1
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('e8e6dbda87f6d4b90ba5eb5a3393b9450cddd86514693a842b00f171ea102c4b')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

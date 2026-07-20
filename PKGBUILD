# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.102.2
pkgrel=1
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
options=('!debug')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
b2sums=('f45526baae1bf07a3a03a2602cfc0cd1224f1b23954f75ea540f1bc7c389773d355309a86efb2881aac67d8383fd44ff708182e57de398f4ab5a4699c7eed913')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

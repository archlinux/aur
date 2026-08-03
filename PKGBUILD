# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.104.5
pkgrel=1
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
options=('!debug')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
b2sums=('fc6972671f2ff8a7e66742f713fefe6e64a60449e22230d274986bc9e4a0176c5c475d69a61142451a3c88bdd5271ad69a78909d5cddeda525d1f97769e27329')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

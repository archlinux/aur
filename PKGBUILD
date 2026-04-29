# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.100.8
pkgrel=2
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
options=('!debug')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('8991a7d21f6eb73e2ea28d4dcb74e8ddec7232c136c8bfdcd1249e6b730d2c36')
b2sums=('b183f4f75b66744fdf172ecb4ccee826d0375f3fe6f75597cb131804b4996475ec285a8565a20e59c1929cdab9afadb357bede3567bfd170508ce7e2f522e5a1')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

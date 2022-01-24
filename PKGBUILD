# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.37.0
pkgrel=1
_pkgver_suffix=187
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('686febc50d0b2c041e176e08dec1897451f8074ae0ec8da81e5d4605162980f3')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

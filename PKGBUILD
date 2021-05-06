# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.28.2
pkgrel=1
_pkgver_suffix=132
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('0e9c58f2f20053b4fa035acd85d4491e1d01eb74f8335f065d93471e02e80a40')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

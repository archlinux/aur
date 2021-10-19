# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.33.3
pkgrel=1
_pkgver_suffix=162
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('76bc46850b227326609adc1e9b9c594c5249c610c2fced0f4fcab4f07adc4d93')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

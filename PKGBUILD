# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.44.0
pkgrel=1
_pkgver_suffix=218
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('f454bf23b7bc794d8d1c2b0c75c8d7147e708c2a9e8b6785d67964a9b69116f9')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

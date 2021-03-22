# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.28.0
pkgrel=2
_pkgver_suffix=127
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('f2d875bf77a5d62f9429903df9c64ba472f830d92c252d570933bee4b03674fc')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

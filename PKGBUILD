# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.34.0
pkgrel=1
_pkgver_suffix=165
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('6a3afd831e880213d859618d4b7783fe44bd8e2d5d62865d544bd566887d4886')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.29.0
pkgrel=1
_pkgver_suffix=134
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('c48c1e999c84a27651aa0c489dbec3f69667f3e01699d6515ec6330e6dabbb08')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

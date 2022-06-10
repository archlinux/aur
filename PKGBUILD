# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.47.7
pkgrel=1
_pkgver_suffix=238
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('88e89b040cd35433b0a138450ccdf81627acda79764bff5bbc7bdfbdcae5cbd7')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

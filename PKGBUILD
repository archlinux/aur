# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.33.0
pkgrel=1
_pkgver_suffix=156
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('eb3e2202bcea8cc53193f1cd2a8df1234d6d3526aacb3d7850f5029374b704f9')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

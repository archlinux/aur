# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.32.0
pkgrel=1
_pkgver_suffix=151
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('194a1f8d233a12b777c1a7d59e4f5588f72c2e68b1c2793cb9e3de61b25f2344')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

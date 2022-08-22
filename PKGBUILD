# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.53.1
pkgrel=1
_pkgver_suffix=268
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('4ae99a62d1dd366f97a6eacfeb9481bff4f6f54100556e0f4f9ae8915e1c536e')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

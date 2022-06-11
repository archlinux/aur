# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.47.8
pkgrel=1
_pkgver_suffix=242
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('4ab6fbf253364cb258cef1a23eede586ab97f7ea53c25d8d1f66157b88b711ca')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

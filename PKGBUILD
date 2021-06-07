# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.30.1
pkgrel=1
_pkgver_suffix=139
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('aff69f5a61d43056ec941ba3e3b8773e63db00826b1817b18fe1b0bf009d902b')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

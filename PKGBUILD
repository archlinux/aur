# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.54.3
pkgrel=1
_pkgver_suffix=283
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('ab6d502644df929b03e3689f325140b122a34d78184a67b8cf3ec3c7a4d3ea8a')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

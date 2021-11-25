# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.35.0
pkgrel=1
_pkgver_suffix=176
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('f7033f60e57676aea9e0bb85fc530cb23276413ac99128bccb77c0860c2ff18d')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

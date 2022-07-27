# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.50.1
pkgrel=1
_pkgver_suffix=260
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('ef47445eda798549a3e17e423041a3b8f41a4372e39ab249bb6be7d73c48d694')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

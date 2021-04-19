# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.28.1
pkgrel=1
_pkgver_suffix=129
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('0e6def5299b10778d993e97b20e0fc49ddfcdbfcb6e85261ebca960039c5a447')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

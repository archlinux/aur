# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.45.1
pkgrel=1
_pkgver_suffix=220
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('8191e4a4b9e6bb132c460496ebea9e10eb8c84cc8e46cdde22f8b4877bb0412b')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

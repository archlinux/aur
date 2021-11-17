# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.34.2
pkgrel=1
_pkgver_suffix=173
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('8443e51f5d808fcc4b5f638fb329f1269eb9151440b490941e6817936563c4b7')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

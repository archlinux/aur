# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.31.0
pkgrel=1
_pkgver_suffix=149
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('e9b2029c57eadd7bf659a8b4473303b779d31be68c8a90164575b3d4f35bd3cf')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

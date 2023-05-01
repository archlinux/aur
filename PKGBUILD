# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.70.6
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver.rpm")
sha256sums=('c677fb3e7ae955b02536729624118d24b0dbd05c0c0463c7a93c4115a728b994')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

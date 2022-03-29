# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.43.1
pkgrel=1
_pkgver_suffix=216
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('d6ecc80e25b8c37bad686d7832e74157dbbc4b623dde295fa602f06d13888ac6')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

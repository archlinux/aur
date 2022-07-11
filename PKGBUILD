# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.49.2
pkgrel=1
_pkgver_suffix=255
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('bec533a4e457f68236d9138705db97170b2d2db7dba4f343aa1aa7fa34f7271f')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

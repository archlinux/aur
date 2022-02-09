# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.39.2
pkgrel=1
_pkgver_suffix=192
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('8b55c8b0080d337f3310ee3422c3863a2f2fe3c1f3f21994efcc300dbd795f83')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

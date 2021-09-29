# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.33.2
pkgrel=1
_pkgver_suffix=158
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('617ce2cb20b23f20cf4ae0b34d9a9f2a35d340643bacd720dba9364000cbe67e')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

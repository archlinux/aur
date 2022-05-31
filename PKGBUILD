# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.47.6
pkgrel=1
_pkgver_suffix=233
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('1fbee153ee01a8558f25cf8972125ad050b53dcf7a60a8eed5770f5863c2b024')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

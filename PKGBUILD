# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.55.1
pkgrel=1
_pkgver_suffix=290
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('324964c830bcdaeb862ce3893126a2b82d48b95d31d6ce7d66cca56acf7fcdbf')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

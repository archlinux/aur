# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.41.1
pkgrel=1
_pkgver_suffix=201
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('0075d302daebd14dd922235ca383b70ab98116e4c60cb0b4789ec2f3e1a508ee')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

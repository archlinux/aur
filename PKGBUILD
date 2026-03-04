# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.99.3
pkgrel=1
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custon:atomicwallet')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
sha256sums=('9312debc4c0dc227341ca84d4c9ea15d858949b690feb8a0d287b50af93df18e')
b2sums=('1e2a99701f4d5a38bbdb45c27a11663c884d1ae54fbc8ad328fa55d5ac0f7fc78cf0cf7145b1e78480d72a4fc502645bb896a03d1176df8ca1e5b1213689633d')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}

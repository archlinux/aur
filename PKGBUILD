# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.4.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://sia.tech/releases/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('6aab6edd1684ed98bb709e71a3eb5c885d0177e98e58e4ec85295a1314a208da')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}

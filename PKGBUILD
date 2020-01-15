# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.4.2.0
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://sia.tech/releases/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('09ce688668c8392abc1861e0761c522dd04acce8a54bf9ffab581376c0cfc504')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}

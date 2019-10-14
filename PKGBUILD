# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.4.1.2
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://sia.tech/releases/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('2aa5f8c37cb6d3af8588030f82e4584889fe7269cb50d6d397acd695fe69b380')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}

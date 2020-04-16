# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.4.7
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://sia.tech/releases/Sia-${_pkgver}-linux-amd64.zip")
sha512sums=('c15276a67dcf50872ddcf1ee311cc5a692ffada9a2fd642e2e18013f78beaeff69362209afac778a4c625bbc9dc1f430f8eecab12a5d248d3fb8cef8e9925a59')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}

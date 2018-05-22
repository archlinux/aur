# Maintainer: Paulo Matos <paulo@matos-sorge.com>

pkgname=docker-machine-driver-packet
pkgver=0.1.5
pkgrel=1
pkgdesc="Packet driver for Docker Machine "
arch=('x86_64')
url="https://github.com/packethost/docker-machine-driver-packet"
license=('BSD')
depends=('docker-machine')
makedepends=('go' 'git')
source=("$pkgname-v$pkgver.zip::https://github.com/packethost/$pkgname/releases/download/v$pkgver/docker-machine-driver-packet_linux-amd64.zip")
sha256sums=('af1a69d9c18663b6aac0c86496319651d1bfd5c8dda78fba8835e4c023622fe8')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

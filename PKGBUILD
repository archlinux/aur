# Maintainer: GorgDel <gorgdel18@gmail.com>
pkgname=vivi3
pkgver=3.0.0
pkgrel=1
pkgdesc="Client for Vivi, a wireless screen sharing solution"
arch=('x86_64')
url="https://vivi.io/downloads/"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'glib2' 'libpulse' 'libx11')
source=("vivi-3.0.0.deb::https://downloads.vivi.io/app/3.0.0/vivi.deb")
md5sums=('2b75ccfbc088fe35d33d588ba210b930')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

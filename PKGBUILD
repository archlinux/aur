# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-wallet-bin
pkgdesc="The official Alephium desktop wallet."
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/alephium/alephium-wallet"
license=('LGPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/alephium/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums_x86_64=('76595be840f22d7f908f2922218921b8e1f77c9d3a3640be0dce521c580573c7')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}

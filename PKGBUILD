# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-wallet-bin
pkgdesc="The official Alephium desktop wallet."
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/alephium/alephium-wallet"
license=('LGPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/alephium/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums_x86_64=('cda2ab28d0505d3a1877ac7460db966f4df670be71e626edfbae48e4676b5efc')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}

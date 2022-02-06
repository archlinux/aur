# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-wallet-bin
pkgdesc="The official Alephium desktop wallet."
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/alephium/alephium-wallet"
license=('LGPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/alephium/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums_x86_64=('361efee09335084dd4fcf8ad2da7dd4bd6ec70d8a9e6abdf153519de36c5da65')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}

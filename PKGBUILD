# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-wallet-bin
pkgdesc="The official Alephium desktop wallet."
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/alephium/alephium-wallet"
license=('LGPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/alephium/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64-$pkgver.deb")
sha256sums_x86_64=('a0d77d4846118d9b8a83228b67a8cae1ea46e3293d51b72f0af301b5d240e018')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}

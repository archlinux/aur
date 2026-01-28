# Maintainer: Simon Escano <simon-escano@github>
pkgname=fint-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance, keyboard-driven GUI file manager for Linux"
arch=('x86_64')
url="https://github.com/simon-escano/fint"
license=('MIT')
provides=('fint')
conflicts=('fint')
depends=('webkit2gtk' 'libappindicator-gtk3')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/simon-escano/fint/releases/download/v${pkgver}/fint_${pkgver}_amd64.deb")
sha256sums_x86_64=('060c0405371754ee2cd806868b2227dbef33fb462e706398e5dcb5bcb7c9fcba')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
}

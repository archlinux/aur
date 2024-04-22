# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=tdl-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="A Telegram downloader/tools written in Golang"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/iyear/tdl"
license=("AGPL-3.0-or-later")
depends=()
provides=("tdl")

source_x86_64=("$pkgname-x86_64::https://github.com/iyear/tdl/releases/download/v$pkgver/tdl_Linux_64bit.tar.gz")
source_aarch64=("$pkgname-aarch64::https://github.com/iyear/tdl/releases/download/v$pkgver/tdl_Linux_arm64.tar.gz")
source_armv7h=("$pkgname-armv7h::https://github.com/iyear/tdl/releases/download/v$pkgver/tdl_Linux_armv7.tar.gz")

sha256sums_x86_64=('2d9ac6d36530ba08da44572447120691f5487443a1eb65be189850ddaa6d6c7d')
sha256sums_aarch64=('2c34a9255ae7a79a6cac0c74dd72e79d539813f4f39c4f904f940b44b2b30bb5')
sha256sums_armv7h=('ea7a126b120682e8130dbe87e07e790c2d9cc5bc41c8ba464cd27d3b5e5f7062')

package() {
	cd "$srcdir/"
	install -Dm755 tdl -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

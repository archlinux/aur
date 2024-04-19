# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=tdl-bin
pkgver=0.16.2
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

sha256sums_x86_64=('eb568f590f04ef301dcb0f92576377a8c7cdd4a8c96c63347c5077351d198d37')
sha256sums_aarch64=('5fc85ce595eb3f48ef78ffd3760536ccb32f2eec4a7d452d7aa0bfa7c9ee2ef9')
sha256sums_armv7h=('8c0640252beb657d3802716557186df04797246258a3f05b77956c48160a65df')

package() {
	cd "$srcdir/"
	install -Dm755 tdl -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

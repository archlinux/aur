# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=tdl-bin
pkgver=0.16.0
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

sha256sums_x86_64=('da025868a607bf94f7827a5238cbb70ebffe3e24e9d303c2c4aadf929249bdb2')
sha256sums_aarch64=('12cc584134156c2765a23a2a618a36f710532305f5dd76a556d0c662d2863d38')
sha256sums_armv7h=('546798ff5e9cb32f2fbf27863ff249d7cea06296084015e1339284db7e214df2')

package() {
	cd "$srcdir/"
	install -Dm755 tdl -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

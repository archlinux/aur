# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=tdl-bin
pkgver=0.15.1
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

sha256sums_x86_64=('40f621b58f9f76237a549b6da29edf39be38ce5722ecea92e37f1563dc196fb3')
sha256sums_aarch64=('2e138c129c892912eaa4773b8de4689eb53ce3d70ecf04c51c23ebb3b67f84e7')
sha256sums_armv7h=('520d210d19cda39509c87dc902f4099829213308bce3eadd70b7c92b6fe50e58')

package() {
	cd "$srcdir/"
	install -Dm755 tdl -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

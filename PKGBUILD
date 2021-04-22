# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.2.2
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('aaf9b1c3f592a0adc548703dd4fbe01a')
sha1sums=('e389e192bc77ac486658cd69f35c7fe8f1af98a5')
sha512sums=('739716f7518d9773e992418fc0b1d92cf57344a8f9b2cecf3912fda5da7f77a6248e6f5c8ec51f52ea921e8246a52ee948a795b7d084a3a66cb1a16b5cc87d8f')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" build install
}

# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.5.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('b7fef63f6b40a473b64c5711faad7f81')
sha1sums=('de58253e83c855f609861993f63fd6f68554c630')
sha512sums=('27fbe472c3fdb94de4c7c440220317ab79aab65c223c9a5ec97111854e5c43976beb1cbceb7c0a1b79a80c3d9c565633105154397741a7801f3755d793b820a7')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

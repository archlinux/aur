# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.3.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('58252aadf5733eb1530a18efebe7edc2')
sha1sums=('5859cfc7391a892525c9fc0636be73f8ad46384a')
sha512sums=('463548f3f79eafd8c3bcee8a57082a0c0ae6bf6bfa4e22f0f604938d71f3637a6e406b2828aa4d75aa448ff323c26498771ed5005f9066998fb4db63753d7f9c')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

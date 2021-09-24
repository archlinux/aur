# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=26
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('db976d9d77c5c161079a21e6e73ec06b')
sha1sums=('70e9eb164c2453534ae52cee4f256c4cc25ae32a')
sha512sums=('b5018f771c68e59531275a7e9c5f37720aa8cfa12e686f91bc8c5f896c0c2b7bc14311ee44f6788f7c006261f27b6afbdd1b423a538f77debc4722b8bb226924')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

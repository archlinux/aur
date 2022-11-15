# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=34
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('844572124dd5c80800ee3b0098362ab7')
sha1sums=('06f5bfc747f27ae9ba763a798204badf84d430b2')
sha512sums=('afdca5c3c757948aa5050e500c511acb5e8c455c16c4b83ab689c10152e935a8b8b21fdecc1492a4b66479de6c751a1def15b4db5b6afccb4df66c58cc6c7bad')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

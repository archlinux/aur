# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=24
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('b620b5b665e8265927477b594783c11c')
sha1sums=('5cf762946db6f76605da7e78cd4037fcbac88ec3')
sha512sums=('41c42cd0977ec71646d3bd6ce650e04410b776a68a94530371852904bb93f93bb6b055ee454f5fc02cd7fa7856c48c264c85551b21acea0ee1034702e5c38ea1')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

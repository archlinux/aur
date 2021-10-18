# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=28
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('8edec852843d2c7cbb0b8cf38aaef0cd')
sha1sums=('db84394a539c65a994620f135183b27c1d9d4f86')
sha512sums=('79301b5928089ab14e7d7c4b353ef175cf451f63a1aa7a9d808b138c000c9e2009b9ba1db8ca5ee94209f47e4456ba8640447161e53a580e9549be6c6c9290ec')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

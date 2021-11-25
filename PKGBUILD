# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=31
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('7cfeab37dc9eaac07f71dc5603bee1e5')
sha1sums=('ff20e37235a5e79266a271de09acfa32cb4869a8')
sha512sums=('a974cf5514bf2bbeb51df84496cf09b131360f7b37947368d517f1aa00a97c6ffcb028c818918f1b834d8fefd364da84d2d730208284b76597489f94f8967a79')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

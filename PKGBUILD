# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=33
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=42.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('169c32a48a1d9a7640aabb8f4e88f9b7')
sha1sums=('311e0f1ee5327ebeb62b0a504a77694ad480d8f7')
sha512sums=('2cfcc30b207077cf908c93d5c6707066a10c9aba8e80de46aa9bd3b8ca9a8325e50936c00f3e5936ae6ab122fac914039c0d12f2248045736c5112f958dae511')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

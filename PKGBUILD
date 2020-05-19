# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=20
pkgrel=2
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3')
depends=('gnome-shell>=3.34')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('0dfed0b19b37dd59a686743a1e38fda2')
sha1sums=('774c79faa8fa2c6eafa7a35a3eaa8f2f550485f1')
sha512sums=('fa873d1e138cf65984e48f5955a5082f32c3384cf34bcd7954aa6369615f94d9867bce54a7c9e71513f864aa15c472708354667036900abdbdf7b7a3f5918158')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

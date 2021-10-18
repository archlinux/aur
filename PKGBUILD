# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=27
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('2c6a13a7f844c6436450ff9a230b5701')
sha1sums=('91ee6af09e823c4b19250ecb441f77072768b9cf')
sha512sums=('a171161df32fe36aeca81ab2329b98d370805c85bb411a3edf2c78e48e11404ef8b01b52af6d2795c1d75524aa3aadcfc3cfe80423f5fe08c685e43bac0efe1b')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

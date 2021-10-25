# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=30
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('9f83a847a1e3ec8b04771bf19eda9f28')
sha1sums=('0417c5684355e2c3c4432d94955fc5076171f685')
sha512sums=('9a1268242aae48c53e375a41b7ca124ef915408bc0c0f57e67e1f0a154b0b573ffb2a3304e423b85c4fca89fe09c954b18a60f7b830f3521046f19709f86839c')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

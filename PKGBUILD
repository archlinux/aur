# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=23
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('0a8ec44adcfe1aeda186aaa693059d03')
sha1sums=('ffc6d64839a5883f0f8106ec3aebd6b735a12eef')
sha512sums=('15231213c4db6606041e54064c5bc0fe86334e40b1370cfbf0edc5eae2b2a36403f4c244a9356b69e0a371e6c385afd3d2f07740f468c4a2f06d9916ebdee2ae')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

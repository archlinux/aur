# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=32
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell>=40.0')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('1170cc246267fe7398f5cd65a5fbba63')
sha1sums=('a76aad57986f20f86aa8d9640b93d2e3fe104e85')
sha512sums=('18e64d3a46fa9038f8c5b148cd0abc0d5091640173c44e5bea834ab4dc3c6de07aa1e03adcb6ad9b2d5a749fa6008b98a945c6201e9267ee5161940b1720f94b')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

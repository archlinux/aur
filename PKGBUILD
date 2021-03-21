# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=21
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the dauy"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3')
depends=('gnome-shell>=3.34')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
md5sums=('bbf03fa59a2871ee942facbbc44ea134')
sha1sums=('98919c238bb8f1fc2c4b25e2892a1f468ad42c32')
sha512sums=('e6aceacec57e35efbb0cf482a7792db9171b4c06ec9ce2a4ef236648a9f5f8db790a66bfb1ce66a66db9bc13c30a6ae773639316515a53d17911e29e6ae7396b')

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}

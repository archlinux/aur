# Maintainer: Ivan Kolesnikov <kiv.apple@gmail.com>
pkgname=gnome-shell-extension-backlight-control
pkgver=1.0
pkgrel=1
pkgdesc='A GNOME shell extension for set different backlight levels and idle timeout for AC and battery'
arch=(any)
url="https://github.com/KivApple/gnome-shell-extension-backlight-control"
license=('GPL2')
depends=('gnome-shell>=3.24')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
	cd gnome-shell-extension-backlight-control
	make
}

package() {
	cd gnome-shell-extension-backlight-control
	make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}


# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-extension-arc-menu
pkgver=v14
pkgrel=1
pkgdesc="Application Menu Extension for GNOME"
arch=('any')
url="https://gitlab.com/arcmenu/ArcMenu"
license=('GPL2')
depends=(
    'gnome-shell-extensions'
    'gnome-tweaks'
    'gnome-menus'
)
conflicts=('gnome-shell-extension-arc-menu-git')
source=("https://gitlab.com/arcmenu/ArcMenu/-/archive/${pkgver}/ArcMenu-${pkgver}.zip")
md5sums=('9cd5cb91f6f1af16b405625681d322e6')

package() {
	cd "ArcMenu-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

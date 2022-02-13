# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-extension-arc-menu
pkgver=v23
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
md5sums=('f8f05a22399082ce12cf27339949216f')

package() {
	cd "ArcMenu-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

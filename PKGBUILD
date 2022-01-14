# Maintainer: Christian Brassat <christian.brassat@gmail.com>

pkgname=gnome-shell-extension-arc-menu
pkgver=v20
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
md5sums=('61047eaab58e502a61c4e4bf40a2a2f9')

package() {
	cd "ArcMenu-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

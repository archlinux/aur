# Maintainer: mglo <marius@mgl.dev>
pkgname=gnome-shell-extension-arc-menu
pkgver=v5
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
sha256sums=('SKIP')

package() {
	cd "ArcMenu-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

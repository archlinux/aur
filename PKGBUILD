# Maintainer: mglo <marius@mgl.dev>
pkgname=gnome-shell-extension-arc-menu
pkgver=v45_Stable
pkgrel=2
pkgdesc="A Dynamic / Traditional / Modern Extension Menu for GNOME"
arch=('any')
url="https://gitlab.com/arcmenu-team/Arc-Menu"
license=('GPL2')
depends=(
    'gnome-shell-extensions'
    'gnome-tweaks'
    'gnome-menus'
)
conflicts=('gnome-shell-extension-arc-menu-git')
source=("https://gitlab.com/arcmenu-team/Arc-Menu/-/archive/${pkgver//_/-}/Arc-Menu-${pkgver//_/-}.tar.gz")
sha256sums=('45cb790f479c75d05614fcdde5b27256777750c8e4fa789c80f01b9d7aa205eb')

package() {
	cd "Arc-Menu-${pkgver//_/-}"
	make DESTDIR="$pkgdir/" install
}
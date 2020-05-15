# Maintainer: mglo <marius@mgl.dev>
pkgname=gnome-shell-extension-arc-menu
pkgver=v46_Stable
pkgrel=1
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
sha256sums=('1054219d952b837edc2b6244243f13ac387b4314944a053e8563985c36d750f0')

package() {
	cd "Arc-Menu-${pkgver//_/-}"
	make DESTDIR="$pkgdir/" install
}

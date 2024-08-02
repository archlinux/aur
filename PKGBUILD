# Maintainer: Wafi Wadud <wafinashwan@gmail.com>
# Maintainer: linushdot <linushdot@github.com>

pkgname=gnome-shell-extension-unsafe-mode-menu
pkgver=9.0
pkgrel=9
pkgdesc="GNOME Shell extension for Unsafe Mode Menu"
arch=('any')
url="https://github.com/linushdot/unsafe-mode-menu"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/linushdot/unsafe-mode-menu.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/unsafe-mode-menu"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/"
	cp -r unsafe-mode-menu@linushdot.local "$pkgdir/usr/share/gnome-shell/extensions/"
}

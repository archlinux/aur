# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >
# Maintainer: Oguzcan Kucukbayrak <oguz@okb1100.com>

pkgname=shadow-icon-theme
pkgver=9.1
pkgrel=0
pkgdesc="This is a flat icon-theme Gnome 3.10+. The icons have colourful circular base with long shadow."
arch=(any)
url="https://www.gnome-look.org/content/show.php/Shadow?content=170398"
license=(GPL3)
makedepends=('git')

source=(git+https://github.com/rudrab/Shadow.git)
sha256sums=('SKIP')

package() {
	cd "$srcdir/Shadow"
	mkdir -p "$pkgdir/usr/share/icons/shadow"
	find . -type d -name ".git" -prune -o -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/shadow/{}" \;
}

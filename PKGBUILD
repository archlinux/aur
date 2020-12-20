# Contributor: Eddie Lozon <almostlucky@attbi.com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-theme-switch2
pkgver=2.1.0
pkgrel=5
pkgdesc="Gtk2 theme switcher"
url="http://muhri.net/nav.php3?node=gts"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gtk2')
source=("http://ftp.de.debian.org/debian/pool/main/g/gtk-theme-switch/gtk-theme-switch_${pkgver}.orig.tar.gz")
md5sums=('a9e7e62701cd4fba4d277dc210cd4317')

build() {
	cd "${srcdir}/gtk-theme-switch-${pkgver}"
	make
}

package() {
	cd "${srcdir}/gtk-theme-switch-${pkgver}"

	install -Dm755 gtk-theme-switch2 "${pkgdir}/usr/bin/gtk-theme-switch2"
	install -Dm644 gtk-theme-switch2.1 "${pkgdir}/usr/share/man/man1/gtk-theme-switch2.1"
}

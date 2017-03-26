# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='macos-icons-theme'
pkgver=3.5
pkgrel=3
pkgdesc='macOS iCons Theme'
arch=('any')
url='https://www.gnome-look.org/p/1102582/'
source=('https://dl.opendesktop.org/api/files/download/id/1487473049/macOS%20iCon%20theme%20v3.5.tar.xz')
md5sums=('9cfe3594b030236b68881208a3402074')
_name="macOS iCon theme v$pkgver"

prepare() {
	cd "$srcdir/$_name"
	find -name '* *' -delete
}

package() {
	cd "$srcdir/$_name"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}

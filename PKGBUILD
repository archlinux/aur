# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Henrik Skärnell <henrik(at)skarnell.se>

pkgname=dvorak-se
pkgver=1
pkgrel=2
pkgdesc="A (non-standard) Swedish dvorak keyboard layout. (Console driver, for the Xorg driver checkout the sv_dvorak package.)"
arch=(any)
url="http://tlundqvist.org/sv_dvorak/"
license=('GPL')
depends=('kbd')
source=("http://tlundqvist.org/sv_dvorak/drivers/dvorak-se.map")
md5sums=('722e35f7fcbe5e066e51d2971ab21745')

package() {
	gzip -f dvorak-se.map
	mkdir -p "$pkgdir"/usr/share/kbd/keymaps/i386/dvorak/
	install -Dm644 dvorak-se.map.gz "$pkgdir"/usr/share/kbd/keymaps/i386/dvorak/
}

# vim: set ts=4 sw=4 noet:

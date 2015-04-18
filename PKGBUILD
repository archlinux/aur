# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=gtksourceview3-asm-intel
pkgver=20120501
pkgrel=1
url="https://wiki.gnome.org/action/show/Projects/GtkSourceView/LanguageDefinitions"
pkgdesc="x86 (Intel) assembly language syntax highlight support in gtksourceview3 for gedit 3 and others"
arch=('any')
license=('unknown')
depends=('gtksourceview3')
source=('asm-intel.lang::https://wiki.gnome.org/Projects/GtkSourceView/LanguageDefinitions?action=AttachFile&do=get&target=asm-intel.lang')
md5sums=('d5b196c1c17b2c7081e12f1f1f24e690')

package() {
	install -Dm644 asm-intel.lang "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/asm-intel.lang"
}

pkgbase=gtksourceview-highlight-asciidoc
pkgname=('gtksourceview2-highlight-asciidoc' 'gtksourceview3-highlight-asciidoc')
pkgver=LATEST
pkgrel=1
pkgdesc='Asciidoc syntax highlighting for gtksourceview'
arch=('any')
url=('https://github.com/gmate')
license=('GPL')
source=('https://github.com/gmate/gmate/raw/master/lang-specs/asciidoc.lang')
sha512sums=('SKIP')

package_gtksourceview2-highlight-asciidoc() {
	conflicts=('asciidoc-gtk-highlight')
	depends=('gtksourceview2')

	install -m644 -D asciidoc.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/asciidoc.lang"
}

package_gtksourceview3-highlight-asciidoc() {
	conflicts=('asciidoc-gtk-highlight')
	depends=('gtksourceview3')

	install -m644 -D asciidoc.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/asciidoc.lang"
}


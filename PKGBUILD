pkgbase=gtksourceview-highlight-rhtml
pkgname=('gtksourceview2-highlight-rhtml' 'gtksourceview3-highlight-rhtml')
pkgver=LATEST
pkgrel=1
pkgdesc='Embedded Ruby syntax highlighting for gtksourceview'
arch=('any')
url=('https://github.com/gmate')
license=('GPL')
source=('https://github.com/gmate/gmate/raw/master/lang-specs/rhtml.lang')
sha512sums=('SKIP')

package_gtksourceview2-highlight-rhtml() {
	depends=('gtksourceview2' 'gtksourceview2-highlight-rails')

	install -m644 -D rhtml.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/rhtml.lang"
}

package_gtksourceview3-highlight-rhtml() {
	depends=('gtksourceview3' 'gtksourceview3-highlight-rails')

	install -m644 -D rhtml.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/rhtml.lang"
}


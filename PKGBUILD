# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=asciidoc-gtk-highlight
pkgver=0.1
pkgrel=2
pkgdesc='AsciiDoc syntax highlight for gtksourceview'
arch=('any')
url='https://launchpad.net/asciidoc-gtk-highlight'
license=('LGPL')
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname.tar.gz)
md5sums=('8062eb44841ee6fe7f21a5fa44c6bd9a')

package() {
	install -m644 -D asciidoc.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/asciidoc.lang"
	install -m755 -d "$pkgdir/usr/share/gtksourceview-3.0/language-specs"
	ln "$pkgdir/usr/share/gtksourceview-2.0/language-specs/asciidoc.lang" "$pkgdir/usr/share/gtksourceview-3.0/language-specs/asciidoc.lang"
}

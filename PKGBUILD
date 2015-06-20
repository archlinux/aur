pkgbase=gtksourceview-highlight-rails
pkgname=('gtksourceview2-highlight-rails' 'gtksourceview3-highlight-rails')
pkgver=LATEST
pkgrel=1
pkgdesc='Ruby on Rails syntax highlighting for gtksourceview'
arch=('any')
url=('https://github.com/gmate')
license=('GPL')
source=('https://github.com/gmate/gmate/raw/master/lang-specs/ruby_on_rails.lang')
sha512sums=('SKIP')

package_gtksourceview2-highlight-rails() {
	depends=('gtksourceview2' 'mime-rails')

	install -m644 -D ruby_on_rails.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/ruby_on_rails.lang"
}

package_gtksourceview3-highlight-rails() {
	depends=('gtksourceview3' 'mime-rails')

	install -m644 -D ruby_on_rails.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/ruby_on_rails.lang"
}


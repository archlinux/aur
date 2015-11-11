_orgname=mkllnk
_reponame=gedit-rails-extensions
pkgbase=gtksourceview-highlight-haml
pkgname=('gtksourceview2-highlight-haml' 'gtksourceview3-highlight-haml')
pkgver=LATEST
pkgrel=1
pkgdesc='HAML syntax highlighting for gtksourceview'
arch=('any')
license=('GPL')
url="https://github.com/$_orgname/$_reponame"
source="git+https://github.com/$_orgname/$_reponame.git"
sha512sums=SKIP

package_gtksourceview2-highlight-haml() {
	depends=('gtksourceview2' 'mime-haml')

	install -m644 -D "$srcdir/$_reponame/language-specs/haml.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/haml.lang"
}

package_gtksourceview3-highlight-haml() {
	depends=('gtksourceview3' 'mime-haml')

	install -m644 -D "$srcdir/$_reponame/language-specs/haml.lang" "$pkgdir/usr/share/gtksourceview-3.0/language-specs/haml.lang"
}


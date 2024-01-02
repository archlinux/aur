pkgname=chicken-doc-repo
pkgver=5.0
pkgrel=1
pkgdesc="Chicken Scheme Documentation repository"
arch=('any')
license=('custom')
url='http://wiki.call-cc.org/eggref/5/chicken-doc'
source=("https://3e8.org/pub/chicken-doc/chicken-doc-repo-5.tgz")
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -d "$pkgdir"/usr/share/chicken/
	cp -r chicken-doc "$pkgdir"/usr/share/chicken/chicken-doc
}

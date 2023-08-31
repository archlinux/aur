pkgbase='pkgbase'
pkgname='pkgbase'

pkgver='8.3.1.13'
pkgrel='1'

arch=('x86_64')

depends=('base')

source=('test.sh')

sha512sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm 755 test.sh "$pkgdir/opt/test.sh"
}

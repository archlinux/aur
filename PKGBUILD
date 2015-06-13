pkgname=colornant
pkgver=1.0.0
pkgrel=1
pkgdesc="NAnt output colorizer"
arch=('any')
url="http://$pkgname.googlepages.com"
license=('GPL2')
depends=('nant' 'perl')
backup=("etc/${pkgname}rc")
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('a83a71fa82f6eee178d01fab853575ee')

package() {
	cd "$srcdir"

	install -D -m755 "usr/local/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 "etc/${pkgname}rc" "$pkgdir/etc/${pkgname}rc"
}

# vim: set ft=sh ts=4 sw=4 noet:

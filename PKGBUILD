# Maintainer: Joe Davis <me@jo.ie>
pkgname='faur'
pkgver='0.1'
pkgrel='2'
arch=('any')
license=('custom:ISC')
depends=('git')
source=('faur.1'
	'faur.sh')
md5sums=('a01b73f1e9abd471e53b11440f94f492'
         '72c778c3c8a782673e4971bfcaa28819')

package() {
	install -D -m 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -m 444 "$srcdir/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}

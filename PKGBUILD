# Maintainer: Joe Davis <me@jo.ie>
pkgname='faur'
pkgver='0.1'
pkgrel='3'
arch=('any')
license=('custom:ISC')
depends=('git')
source=('faur::git+https://gitlab.com/tharkun/faur.git#branch=v0.1')
md5sums=('SKIP')

package() {
	install -D -m 755 "$srcdir/faur/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -m 444 "$srcdir/faur/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}

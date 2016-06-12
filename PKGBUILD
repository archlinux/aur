# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=unix-privesc-check	
pkgver=1.4
pkgrel=1
pkgdesc="A script to find misconfigurations that could allow privilege escalation in UNIX systems"
arch=(any)
url="http://pentestmonkey.net/tools/audit/unix-privesc-check"
license=('GPL2')
source=("http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz")
md5sums=(b278797b8698160ca2d26425930ad13c)

package() {
        cd "$srcdir/$pkgname-$pkgver/"
	install -dm755 "$pkgdir/usr/share/$pkgname"
        cp "$pkgname" "$pkgdir/usr/share/$pkgname/"
        install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
        cp COPYING.GPL "$pkgdir/usr/share/licenses/$pkgname/"
        cp COPYING.UNIX-PRIVESC-CHECK "$pkgdir/usr/share/licenses/$pkgname/"
        install -dm755 "$pkgdir/usr/bin/"
        ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

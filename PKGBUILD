# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=unix-privesc-check
pkgver=1.5
_pkgver=r1_5
pkgrel=1
pkgdesc='Find misconfigurations on UNIX(-like) systems that allow privilege escalation'
arch=('any')
url='http://pentestmonkey.net/tools/audit/unix-privesc-check'
license=('GPL2' 'custom')
provides=("$pkgname")
changelog='CHANGELOG'
source=("https://github.com/pentestmonkey/unix-privesc-check/archive/$_pkgver.tar.gz")
sha256sums=('1435121f4087cc74304498a23f57698fc7eddfca80ca98f032aa009a67c10464')

package() {
	cd "$pkgname-$_pkgver"
    install -Dm644 COPYING.UNIX-PRIVESC-CHECK "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

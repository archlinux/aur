# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=unix-privesc-check
pkgver=1.4
pkgrel=1
pkgdesc='Find misconfigurations on UNIX(-like) systems that allow privilege escalation'
arch=('any')
url='http://pentestmonkey.net/tools/audit/unix-privesc-check'
license=('GPL' 'custom')
provides=("$pkgname")
changelog='CHANGELOG'
source=("http://pentestmonkey.net/tools/unix-privesc-check/$pkgname-$pkgver.tar.gz")
sha256sums=('e1f85e7f69fabadd23756a3d76a0e3d864b21e28763b60ce2e6181290d1c1969')

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 COPYING.UNIX-PRIVESC-CHECK "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Gauge Krahe <gauge.krahe at gmail dot com>

pkgname=fet.sh
pkgver=1.2
pkgrel=1
pkgdesc="A simple fetch written in POSIX shell without any external commands"
arch=(any)
url="https://github.com/6gk/$pkgname"
license=('ISC')
makedepends=('git')
provides=("$pkgname")

source=("$pkgname::git+https://github.com/6gk/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

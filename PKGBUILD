# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=table
pkgver=0.6.10
pkgrel=1
pkgdesc="Command line utility to format and display CSV"
arch=('x86_64')
url="https://strahinja.srht.site/table"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/table/archive/v$pkgver.tar.gz")
md5sums=('335a1fae6aa42e2dd12f1ba3dc0bc47a')

#build() {
#	local redo=$(command -v redo || echo ./do -c)
#	cd $pkgname-v$pkgver
#}

package() {
	local redo=$(command -v redo || echo ./do)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ${redo} install
}

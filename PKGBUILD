# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=dtree
pkgver=0.1.3
pkgrel=1
pkgdesc="Command line program to draw trees"
arch=('x86_64')
url="https://strahinja.srht.site/dtree"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/dtree/archive/v$pkgver.tar.gz")
md5sums=('1573c678127abd98ccefe0275f9425cd')

package() {
	local redo=$(command -v redo || echo ./do)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ${redo} install
}

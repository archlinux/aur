# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=slweb
pkgver=0.5.3
pkgrel=1
pkgdesc="Simple static website generator"
arch=('x86_64')
url="https://strahinja.srht.site/slweb"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/slweb/archive/v$pkgver.tar.gz")
md5sums=('98111b753b37f82baf5120a33b4c27cb')

#build() {
#	local redo=$(command -v redo || echo ./do -c)
#	cd $pkgname-v$pkgver
#}

package() {
	local redo=$(command -v redo || echo ./do)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ${redo} install
}

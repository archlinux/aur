# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=slweb
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple static website generator"
arch=('x86_64')
url="https://strahinja.srht.site/slweb"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/slweb/archive/v$pkgver.tar.gz")
md5sums=('6c7a6c0036cfb7b5d0c45a4373040a87')

package() {
	local redo=$(command -v redo || echo ./do)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ${redo} install
}

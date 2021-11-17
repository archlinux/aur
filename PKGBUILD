# Maintainer: prg <prg _at_ xannode.com>
# Contributor: Megameneer (Dennis Holierhoek) <dennis.hh@hotmail.com>
pkgname=esrpatch
pkgver=02
pkgrel=5
# This line is way over 80 characters, but a clear description for this rather specific tool is hard to make any shorter than this.
pkgdesc="A tool to patch DVD disc images for the Sony PlayStation 2 game console to make them burnable and working with ESR, an app for the PlayStation 2 made to play those burned games without swapping"
arch=('any')
url='http://psx-scene.com/forums/f164/esr-public-beta-58441/'
license=('GPL')
depends=()
makedepends=('w3m')
# Backup mirror
#source=('http://xannode.com/esrpatch-$pkgver.tar.gz')
source=("https://www.psx-place.com/attachments/esrpatch-$pkgver-tar-gz.12843")
sha256sums=('9cddd307b2a0ca5f048797c94309700d1dcbf3cfc570e5fab60e5ae6c798ad9f')

build() {
	cd esrpatch
	gcc main.c -o esrpatch
}

package() {
	cd "$srcdir"/esrpatch
	install -D esrpatch "$pkgdir"/usr/bin/esrpatch
}

# vim: set ts=8 sw=8 tw=0 noet :

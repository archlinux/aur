# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=mememaker-quiet
pkgver=2.0.0
pkgrel=1
pkgdesc="Non-interactive version of mememaker with no bundled images"
arch=('any')
url="http://www.reddit.com/r/ScriptSwap/comments/r1oxf/bash_meme_maker_script_creates_meme_in_terminal/"
depends=('imagemagick' 'ttf-ms-fonts')
conflicts=('mememaker')
provides=('mememaker')
license=('GPL')
source=(mememaker)

package() {
	install -d "$pkgdir"/usr/bin
	install -Dm755 "$srcdir"/mememaker "$pkgdir"/usr/bin/
}

md5sums=('be8d9536805fb1bf6d3e5ef11d3464a0')

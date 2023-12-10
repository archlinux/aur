# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=mememaker-quiet
pkgver=2.0.1
pkgrel=2
pkgdesc="Non-interactive version of mememaker with no bundled images"
arch=('any')
url="https://www.reddit.com/r/ScriptSwap/comments/r1oxf/bash_meme_maker_script_creates_meme_in_terminal/"
depends=('imagemagick' 'ttf-ms-fonts')
conflicts=('mememaker')
provides=('mememaker')
license=('GPL')
source=(mememaker)

package() {
	install -d "$pkgdir"/usr/bin
	install -Dm755 "$srcdir"/mememaker "$pkgdir"/usr/bin/
}

sha256sums=('473a43a7d65d2f599f9e22d21c18308b90f4b0a02bcb2f5b8c785202a530a29d')

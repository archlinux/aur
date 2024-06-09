# Maintainer: TexturedPolak <rafal200725@gmail.com>
pkgname=texturedplayer
pkgver=1.0.1
pkgrel=3
pkgdesc="A simple and minimalistic TUI music player written in python."
arch=('any')
url="https://github.com/TexturedPolak/texturedplayer"
license=('MIT')
depends=('python>=3.8.0-1' 'ffmpeg' 'python-textual')
optdepends=('python-tinytag: get metadata from songs' 
	    'python-pypresence: Discord Rich Presence support')
source=("https://github.com/TexturedPolak/texturedplayer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('67308fbad24682233ae0604b5c22b0e73451dafd5b8c90d1deffdd6232b246dd')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 texturedplayer.py		"${pkgdir}"/usr/bin/texturedplayer
	install -Dm644 texturedplayer_utils.py  	"${pkgdir}"/usr/bin
	install -Dm644 LICENSE.md 	"${pkgdir}"/usr/share/licenses/"${pkgname}"
}

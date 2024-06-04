# Maintainer: TexturedPolak <rafal200725@gmail.com>
pkgname=texturedplayer
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple and minimalistic TUI music player written in python."
arch=('any')
url="https://github.com/TexturedPolak/texturedplayer"
license=('MIT')
depends=('python>=3.8.0-1' 'ffmpeg' 'python-textual')
optdepends=('python-tinytag: get metadata from songs' 
	    'python-pypresence: Discord Rich Presence support')
source=("https://github.com/TexturedPolak/texturedplayer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('28e616e50451743ce8536d25648e16c070f94f04fe6b0ffc9824cd831c7c7579')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 main.py		"${pkgdir}"/usr/bin/texturedplayer
	install -Dm755 utils.py  	"${pkgdir}"/usr/bin
	install -Dm644 LICENSE.md 	"${pkgdir}"/usr/share/licenses/"${pkgname}"
}

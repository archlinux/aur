# Maintainer: ArtFox3  <artfox3@gmail.com>
pkgname="lobster"
pkgver=4.0.0
pkgrel=1
pkgdesc="Shell script to watch Movies/Webseries/Shows from the terminal."
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
makedepends=('git')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'socat: for interacting with the mpv socket, used for the history feature', 'ueberzugpp: used for image preview with fzf')
source=("$pkgname::git+$url")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}

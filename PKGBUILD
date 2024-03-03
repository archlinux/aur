# Maintainer: chomsky <ivanonarch at tutanota dot com>
# Contributor: Behnam Lal <dev at behnamlal dot xyz>
pkgname="lobster"
pkgver=v4.2.3
pkgrel=1
pkgdesc="Shell script to watch Movies/Webseries/Shows from the terminal."
arch=('any')
url="https://github.com/justchokingaround/lobster.git"
license=('GPL2')
makedepends=('git')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'ueberzugpp: used for image preview with fzf')
provides=($pkgname)
conflicts=($pkgname)
source=("$pkgname::git+$url")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}

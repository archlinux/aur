# Maintainer: chomsky <ivanonarch at tutanota dot com>
# Contributor: Behnam Lal <dev at behnamlal dot xyz>
pkgname="lobster"
pkgver=v4.2.3
pkgrel=2
pkgdesc="Shell script to watch Movies/Webseries/Shows from the terminal."
arch=('any')
url="https://github.com/justchokingaround/lobster"
license=('GPL2')
makedepends=('git')
depends=('grep' 'sed' 'curl' 'fzf' 'mpv' 'html-xml-utils' 'patch')
optdepends=('vlc: An alternative video player', 'ffmpeg: for downloading videos', 'rofi: external launcher', 'ueberzugpp: used for image preview with fzf')
provides=($pkgname)
conflicts=($pkgname)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('db97ccdf0039f0b7119f62e7b9fa53f4')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}

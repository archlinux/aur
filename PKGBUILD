# Maintainer: chomsky <ivanonarch at tutanota dot com>
# Contributor: Behnam Lal <dev at behnamlal dot xyz>
pkgname="lobster"
pkgver=v4.5.0
pkgrel=1
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
md5sums=('fb74a3bb4b458ed78a7a944510a1590d')

package() {
	cd "$srcdir/$pkgname-${pkgver#v}"
	install -Dm755 "./lobster.sh" "$pkgdir/usr/bin/lobster"
}

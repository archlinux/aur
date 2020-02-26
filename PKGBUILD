# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=reflex-curses
pkgver=0.9.2
pkgrel=2
pkgdesc="A TUI/CLI twitch.tv streamlink wrapper. Fork of twitch-curses."
arch=('any')
url="https://github.com/foldex/reflex-curses"
license=('GPL3')
depends=('python' 'python-requests' 'python-urllib3' 'streamlink' 'util-linux')
optdepends=('mpv: Default player for streams'
		    'xclip: Copy channel urls to clipboard')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9dd7b8c2928f5789753da55757375c3798c6a95a91efd523c4b33aa0e0e86f6d')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

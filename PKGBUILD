# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=reflex-curses
pkgver=0.9.3
pkgrel=1
pkgdesc="A TUI/CLI twitch.tv streamlink wrapper. Fork of twitch-curses."
arch=('any')
url="https://github.com/foldex/reflex-curses"
license=('GPL3')
depends=('python' 'python-requests' 'python-urllib3' 'streamlink' 'util-linux')
optdepends=('mpv: Default player for streams'
		    'xclip: Copy channel urls to clipboard')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4cc09f6b42ca8b55e33c22426e8498984d42c480c1eac1c55d9574276c1c299')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

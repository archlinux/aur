# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=reflex-curses
pkgver=0.9.4
pkgrel=1
pkgdesc="A TUI/CLI twitch.tv streamlink wrapper. Fork of twitch-curses."
arch=('any')
url="https://github.com/foldex/reflex-curses"
license=('GPL3')
depends=('python' 'python-requests' 'python-urllib3' 'streamlink' 'util-linux')
optdepends=('mpv: Default player for streams'
		    'xclip: Copy channel urls to clipboard')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a401ca5316e831290fbee18078127b1ffa90176fc9cadef3094148a74564efae')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

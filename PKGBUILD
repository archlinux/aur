# Maintainer: foldex <foldex (a) pm |dot| me>
pkgname=reflex-curses
pkgver=0.9.2
pkgrel=1
pkgdesc="A TUI/CLI twitch.tv streamlink wrapper. Fork of twitch-curses."
arch=('any')
url="https://github.com/foldex/reflex-curses"
license=('GPL3')
depends=('python' 'python-requests' 'python-urllib3' 'streamlink' 'util-linux')
optdepends=('mpv: Default player for streams'
		    'xclip: Copy channel urls to clipboard')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('346cfa8ff54ab2f0caa1a485ae5e9a74c0225b6735e59ce94020adc79b718b9f')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

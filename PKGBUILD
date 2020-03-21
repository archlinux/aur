# Maintainer: Jake Stanger <mail@jstanger.dev>
pkgname=mpd-discord-rpc
pkgver=1.1.2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Displays your currently playing song / album / artist from MPD in Discord using Rich Presence."
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/JakeStanger/mpd-discord-rpc
}

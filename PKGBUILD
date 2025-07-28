# Maintainer: Nouvborne <nouvborne@aur>
pkgname=lyricify
pkgver=1.0
pkgrel=1
pkgdesc="Terminal tool to display synced Spotify lyrics using playerctl and lrclib.net"
arch=('any')
url="https://github.com/nouvborne/lyricify"
license=('GPL3')
depends=('python' 'playerctl' 'python-requests')
source=('lyricify')
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/lyricify" "$pkgdir/usr/bin/lyricify"
}

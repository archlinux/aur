# PKGBUILD
pkgname=lyse
pkgver=1.3.0
pkgrel=1
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyricspot-pcse"
license=('MIT')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyricspot-pcse/main/lyse.py")
sha256sums=('5ce33e48c70efcd92ba03df253f3ec9b7b9e1002833d0ca809b4c2306ba700ef')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

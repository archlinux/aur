# PKGBUILD
pkgname=lyse
pkgver=2.1.2
pkgrel=1
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyse/bb8928410b28b4d5d29c11932ab84d9e832e104a/lyse.py")
sha256sums=('9fac49346aaca591b0791b271f444f00b9bba7777a3d041ced1be1b1c834461c')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

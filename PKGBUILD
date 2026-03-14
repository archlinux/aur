# PKGBUILD
pkgname=lyse
pkgver=2.2.0
pkgrel=1
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyse/7f5bfe073ebe3c41768796d46f27da7bc003e0f8/lyse.py")
sha256sums=('9fac49346aaca591b0791b271f444f00b9bba7777a3d041ced1be1b1c834461c')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

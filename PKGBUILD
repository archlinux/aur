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
sha256sums=('ea33f8d1f5bf23189c877d4ae1af3da69c319089f9a996786bfa0e1cdece8ed6')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

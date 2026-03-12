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
sha256sums=('78418db6930b1430fb0935301189f2afb37069b89d161c3ae0b8372dab366fcf')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

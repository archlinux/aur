# PKGBUILD
pkgname=lyse
pkgver=2.1.1
pkgrel=1
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyse/934d3b73030286c2f354c8551952933a678eeed3/lyse.py")
sha256sums=('2e22e573e5c01820b17c41d134d38c2e14081f4bf51cca037c2f1737d27f81da')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

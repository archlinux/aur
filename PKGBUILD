# PKGBUILD
pkgname=lyse
pkgver=2.0.0
pkgrel=2
pkgdesc="Realtime TUI lyrics for your favorite songs, directly in the terminal."
arch=('any')
url="https://github.com/snoowfall/lyse"
license=('AGPLv3')
depends=('python' 'playerctl')
source=("https://raw.githubusercontent.com/snoowfall/lyse/refs/heads/main/lyse.py")
sha256sums=('df553c82387a0d49476904e78703402d807833ce63b0b4c0c6e068ba9277fe50')

package() {
    install -Dm755 "$srcdir/lyse.py" "$pkgdir/usr/bin/lyse"
}

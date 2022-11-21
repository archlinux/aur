# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>

pkgname=package-sizes
pkgver=r1
pkgrel=1
pkgdesc='list pacman packages sorted by their removable size.'
url="https://aur.archlinux.org/packages/$pkgname"
arch=('any')
license=('Unlicense')
depends=('pacman' 'pacutils' 'awk')
source=("$pkgname")
sha256sums=('a882fc3dc39010b94f853fde8e9db19074122a9c2924eb9c0b05a9922739c01c')

package() {
    cd "$srcdir"
    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
}

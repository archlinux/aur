# Maintainer: Postoronca Dumitru <postoroncadumitru@gmail.com>
pkgname=game-of-life-cli
pkgver=1.0
pkgrel=1
pkgdesc="A Python implementation of Conway's Game of Life"
arch=('any')
url="https://github.com/DdimaPos/game-of-life-cli"  # Update with your project's URL if applicable
license=('MIT')
depends=('python' 'python-numpy')
source=("gol-cli.py")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/gol-cli.py" "$pkgdir/usr/bin/game-of-life-cli"
}

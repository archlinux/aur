pkgname=pac-pacman-aliases
pkgver=1.7
pkgrel=1
pkgdesc="Add pac with apt-like pacman aliases and bash globbing pattern search instead of regex."
arch=('any')
url="https://github.com/bbedward/pac-pacman-aliases"
license=('MIT')
source=("https://github.com/bbedward/pac-pacman-aliases/archive/refs/tags/v1.7.zip")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/pac-pacman-aliases-1.7/src/pac" "$pkgdir/usr/local/bin/pac"
}

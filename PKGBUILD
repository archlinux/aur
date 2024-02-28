pkgname=pac-pacman-aliases
pkgver=1.8
pkgrel=1
pkgdesc="Add pac with apt-like pacman aliases and bash globbing pattern search instead of regex."
arch=('any')
url="https://github.com/bbedward/pac-pacman-aliases"
license=('MIT')
source=("https://github.com/bbedward/pac-pacman-aliases/archive/refs/tags/v1.8.zip")
sha256sums=('SKIP')
conflicts=('pac-wrapper')

package() {
  install -Dm755 "$srcdir/pac-pacman-aliases-1.8/src/pac" "$pkgdir/usr/local/bin/pac"
  install -Dm644 "$srcdir/pac-pacman-aliases-1.8/src/completions.bash" "$pkgdir/usr/share/bash-completion/completions/pac"
}

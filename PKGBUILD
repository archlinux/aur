pkgname=pac-pacman-aliases-zsh-completions
pkgver=1.9
pkgrel=1
pkgdesc="Zsh completions for pac-pacman-aliases"
arch=('any')
url="https://github.com/bbedward/pac-pacman-aliases"
license=('MIT')
depends=('zsh' 'pac-pacman-aliases')
source=("https://github.com/bbedward/pac-pacman-aliases/archive/refs/tags/v1.9.zip")
sha256sums=('SKIP')

package() {
  install -Dm644 "$srcdir/pac-pacman-aliases-1.9/pac-pacman-aliases-zsh-completions/src/_pac_pacman_completions" "$pkgdir/usr/share/zsh/site-functions/_pac_pacman_completions"
}

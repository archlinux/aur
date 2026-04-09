pkgname=pysnake
pkgver=1.6
pkgrel=7
pkgdesc="a TUI snakegame written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/python---a-snake-game'
source=("pysnake.py")
sha256sums=('0409d88437812da4ac27b44291f6cd7050d0940898a0354f826f0202a6f802e4')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/pysnake.py" "$pkgdir/usr/bin/pysnake"
}

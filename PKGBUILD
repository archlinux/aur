pkgname=pysnake
pkgver=1.5
pkgrel=6
pkgdesc="a TUI snakegame written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/python---a-snake-game'
source=("pysnake.py")
sha256sums=('e238fe07bcf707b995e60b672bca0c0ca94157cbf5a03cd8a23e6a9e7d27bc9a')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/pysnake.py" "$pkgdir/usr/bin/pysnake"
}

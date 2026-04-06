pkgname=pysnake
pkgver=1
pkgrel=1
pkgdesc="a TUI snakegame written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/python---a-snake-game'
source=("snakegame.py")
sha256sums=('95263b70938ae5e3ddbf428dded7b557da47f3a88844c51020848501c5470daa')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/snakegame.py" "$pkgdir/usr/bin/pysnake"
}

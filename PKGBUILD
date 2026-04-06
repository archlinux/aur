pkgname=pysnake
pkgver=1.3
pkgrel=4
pkgdesc="a TUI snakegame written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/python---a-snake-game'
source=("pysnake.py")
sha256sums=('ed81e7800385c1adbdd931c450eeae726659541192bd39cc266e5eeea70ed5e7')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/pysnake.py" "$pkgdir/usr/bin/pysnake"
}

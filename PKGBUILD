pkgname=pysnake
pkgver=1.1
pkgrel=2
pkgdesc="a TUI snakegame written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/python---a-snake-game'
source=("pysnake.py")
sha256sums=('be6a40097b16b65f36de6318665a6c7a69c8acd75dc64a5bf338e0bc1fe42950')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/pysnake.py" "$pkgdir/usr/bin/pysnake"
}

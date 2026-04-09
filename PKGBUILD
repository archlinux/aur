pkgname=pysnake
pkgver=1.7
pkgrel=8
pkgdesc="a TUI snakegame written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/python---a-snake-game'
source=("pysnake.py")
sha256sums=('151a4b5199ef8c8da0f9ae12d23977bfcca74c3bae26a716f1c474f8da335f13')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/pysnake.py" "$pkgdir/usr/bin/pysnake"
}

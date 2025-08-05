pkgname=musiccli
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple CLI tool for music playback using Python"
arch=('any')
url="https://github.com/C0d3RW/musicCLI"
license=('MIT')
depends=('python')
source=("testpython.py")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/testpython.py" "$pkgdir/usr/bin/musiccli"
}

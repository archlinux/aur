pkgname=ptodo
pkgver=3.1
pkgrel=12
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('50fa984d0de5b0c19d1b7fddf33f87ff97345cc33721edeac8e0816a3f5bdf6d')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

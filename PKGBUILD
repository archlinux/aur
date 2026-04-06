pkgname=ptodo
pkgver=4
pkgrel=13
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('c60b6cf8cd512cbd544a3bae410ce5d23c55c14091b6a2f8b6bbb67fe985b266')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

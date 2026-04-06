pkgname=ptodo
pkgver=4.1
pkgrel=14
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('2cc368dd34ec6aff3f8e8089c2c30137d3c5b6d116e09696a405036c1d8e30da')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

pkgname=ptodo
pkgver=5.2
pkgrel=18
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('5329ff4fe7ed79abcdd49fbb08baec360688853ac2fc98b7a4c9d6dec496e1f7')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

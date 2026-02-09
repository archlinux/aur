pkgname=ptodo
pkgver=2.0
pkgrel=5
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python' 'python-rich')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('58fd4244de9ee26dbf1b488b906ab489520ba938ce18b92230044fda14253bd4')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

pkgname=ptodo
pkgver=2.1
pkgrel=6
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python' 'python-rich')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('83c39164284486c279e1ccb0ff9dcf12853ac69a90764e31aa7187ff0af28eb0')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

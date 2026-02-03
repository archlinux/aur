pkgname=ptodo
pkgver=1.3
pkgrel=3
pkgdesc="a TUI todolist app written in python"
arch=('any')
depends=('python' 'python-rich')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('a80e22a9a250798e8a27a9c59577e63ef71883023c6351b81e4dff563e3abf71')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

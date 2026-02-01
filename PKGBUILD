pkgname=ptodo
pkgver=1.1
pkgrel=2
pkgdesc="a TUI todolist app written in python"
arch=('any')
depends=('python' 'python-rich')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('19b0d4ef3b7de0d041efa5d06649999a1e60666a9b0fddcc979f977761f6deed')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

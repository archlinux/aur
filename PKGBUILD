pkgname=ptodo
pkgver=2.2
pkgrel=7
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python' 'python-rich')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('0baa9e891e461aefd279463906ef6ac0cea83fcb9b7fd3721c85d358f8239a18')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

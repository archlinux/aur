pkgname=ptodo
pkgver=5.3
pkgrel=19
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('933c5aa14480bfabbbb614ebbfe2efb50504fc82d474a8c97e1afb4106e5bc26')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

pkgname=ptodo
pkgver=5.4
pkgrel=20
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('3c42937d338c0a7f0a44013c8e84a033b1fed5d3f28c52517629d3a6a62d1999')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

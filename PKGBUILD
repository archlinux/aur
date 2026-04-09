pkgname=ptodo
pkgver=5.5
pkgrel=21
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('7b7f881d5fe8f39faed5ec5380192d1d51006684b8d39caac05d1ff448e7f3c1')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

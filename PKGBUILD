pkgname=ptodo
pkgver=2.4
pkgrel=10
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python' 'python-rich')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('bcf96674874a1e83c2461876d5637d7b0663df5ac0747d63c7e29b0e3faeda0d')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

pkgname=ptodo
pkgver=4.2
pkgrel=15
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('34227bb149d47e794c61e31106e0f1876b89ebc6790b339cce3b14d727fe5805')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

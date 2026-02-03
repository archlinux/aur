pkgname=ptodo
pkgver=1.4
pkgrel=4
pkgdesc="a TUI todolist app written in python"
arch=('any')
depends=('python' 'python-rich')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('58fcae97f81a17d7ce224cf42af1f28056395aed9e007bef33f90bcee30ef01c')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

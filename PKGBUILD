pkgname=ptodo
pkgver=1.0
pkgrel=1
pkgdesc="My cool python script"
arch=('any')
depends=('python' 'python-rich')
source=("ptodo.py")
sha256sums=('8b46988ddf1a9cbd4ed3579231be0dd4cdd353839ea0cc36bf450377dce34495')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}

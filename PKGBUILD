pkgname=termalyr
pkgver=1.0.0
pkgrel=5
pkgdesc="Synchronized song lyrics in your terminal"
arch=('any')
url="https://github.com/pyosek/termalyr"
license=('MIT')
depends=('python' 'python-requests' 'python-pyfiglet' 'python-setproctitle' 'playerctl')
_repo="https://raw.githubusercontent.com/pyosek/termalyr/main"
source=(
  "termalyr.py::$_repo/termalyr.py"
  "launcher::$_repo/launcher"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 launcher "$pkgdir/usr/bin/termalyr"
  install -Dm644 termalyr.py "$pkgdir/usr/share/termalyr/termalyr.py"
}
pkgname=termalyr
pkgver=1.0.0
pkgrel=3
pkgdesc="Synchronized song lyrics in your terminal"
arch=('any')
url="https://github.com/yarochek/termalyr"
license=('MIT')
depends=('python' 'python-requests' 'python-pyfiglet' 'python-setproctitle' 'playerctl')
source=(
  "termalyr.py::https://raw.githubusercontent.com/yarochek/termalyr/main/termalyr.py"
  "launcher::https://raw.githubusercontent.com/yarochek/termalyr/main/launcher"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 launcher "$pkgdir/usr/bin/termalyr"
  install -Dm644 termalyr.py "$pkgdir/usr/share/termalyr/termalyr.py"
}

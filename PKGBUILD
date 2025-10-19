pkgname=aurix
pkgver=0.5
pkgrel=1
pkgdesc="A simple and modern AUR helper written in Python"
url="https://github.com/shinichiroisumi/aurix"
license=('MIT')
depends=('python' 'python-requests' 'git' 'base-devel')
source=("$pkgname.py::https://github.com/shinichiroisumi/aurix/blob/main/aurix.py")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  install -Dm755 $pkgname.py -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
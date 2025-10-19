pkgname=aurix
pkgver=0.5
pkgrel=1
pkgdesc="A simple and modern AUR helper written in Python"
arch=('any')
url="https://github.com/shinichiroisumi/aurix"
license=('MIT')
depends=('python' 'python-requests' 'git' 'base-devel')
source=("$pkgname.py::https://github.com/shinichiroisumi/aurix/blob/main/aurix.py"
"LICENSE::https://github.com/shinichiroisumi/aurix/blob/main/LICENSE"
)
sha256sums=('SKIP'
            'SKIP')

package() {
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
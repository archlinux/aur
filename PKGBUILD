pkgname=python-spur
pkgver=0.3.20
pkgrel=1
pkgdesc="Run commands and manipulate files locally or over SSH using the same interface"
arch=('any')
url='https://github.com/mwilliamson/spur.py'
license=('BSD')
depends=('python' 'python-paramiko')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwilliamson/spur.py/archive/$pkgver.tar.gz")
sha256sums=('26c18de85fbd2f8c6bc30ca272668a3541dd8f8b74c926b484217a9674de5c9c')

package() {
  cd spur.py-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

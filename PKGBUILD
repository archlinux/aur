pkgname=python-spur
pkgver=0.3.19
pkgrel=1
pkgdesc="Run commands and manipulate files locally or over SSH using the same interface"
arch=('any')
url="https://github.com/saghul/aiodns"
license=('BSD')
depends=('python' 'python-paramiko')
md5sums=('220c7b2bc58b9d8046c1e108a077f05b')

source=("https://github.com/mwilliamson/spur.py/archive/${pkgver}.tar.gz")

package() {
  cd "spur.py-$pkgver"
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  python setup.py install --root="$pkgdir/" --optimize=1
}

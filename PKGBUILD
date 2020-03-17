pkgname='python-bittrex'
pkgver=0.3.0
pkgrel=1
pkgdesc='Python bindings for bittrex'
url='https://github.com/ericsomdahl/python-bittrex'
license=('MIT')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('8588f8b2d9059e113398ebc0ad0a7f31')
makedepends=('python-setuptools')
depends=('python-requests')

package_python-bittrex() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname[0]}"
}

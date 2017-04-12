pkgname='python2-smbus2'
_pkgname=${pkgname#python2-}
pkgver=0.1.4
pkgrel=1
pkgdesc="A drop-in replacement for smbus-cffi/smbus-python in pure Python"
arch=('any')
url="https://github.com/kplindegaard/smbus2"
license=('GPL2')
depends=('python2')

source=("https://github.com/kplindegaard/smbus2/archive/$pkgver.tar.gz")
sha1sums=('bfbf5c7cbe9ff1bd5efdc0c6237afacb6671df4c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

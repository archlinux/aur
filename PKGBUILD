pkgname=python-symfit
pkgver=0.5.4
pkgrel=1
pkgdesc='Symbolic fitting for python - fitting as it should be'
arch=('any')
url='https://github.com/tBuLi/symfit'
depends=('python' 'python-numpy' 'python-sympy')
makedepends=('python-setuptools')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tBuLi/symfit/archive/$pkgver.tar.gz")
md5sums=('fc2a6606d1ddf511524e03153799a2d0')

package() {
    cd "$srcdir/symfit-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

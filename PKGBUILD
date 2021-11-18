

pkgname=python-interpolation 
_pkgname=interpolation
pkgver=2.2.1
pkgrel=1 
pkgdesc="Optimized interpolation routines in Python / numba"
url="https://files.pythonhosted.org/packages/1b/19/884e31db7f9904678e7575a6ded13d5870a7eae7452f5ccee44fc9f14968/interpolation-2.2.1.tar.gz"
arch=('any')
license=('MIT')
depends=('python')
source=('https://files.pythonhosted.org/packages/1b/19/884e31db7f9904678e7575a6ded13d5870a7eae7452f5ccee44fc9f14968/'$_pkgname'-'$pkgver'.tar.gz')
md5sums=('6e6f0aec155ee2720d2da2b925e982b8')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
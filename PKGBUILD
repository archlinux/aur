pkgname=python-pytweening
pkgver=1.0.3
pkgrel=1
pkgdesc="A set of tweening / easing functions implemented in Python."
arch=("any")
url="https://github.com/asweigart/pytweening"
license=("BSD")
makedepends=("python-setuptools")
source=(https://pypi.python.org/packages/source/P/PyTweening/PyTweening-${pkgver}.zip)
md5sums=('41176abe770e8c318dc1f4213831e6da')

package() {
  cd "$srcdir/PyTweening-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

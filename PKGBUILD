pkgname=python-lookfor
pkgver=0.0.1
pkgrel=1
pkgdesc="Search magic extension for IPython interpreter"
arch=('any')
url="https://github.com/jschueller/lookfor"
license=('BSD')
depends=('ipython')
makedepends=('setuptools' 'git')
source=($pkgname-$pkgver::git+https://github.com/jschueller/lookfor.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}

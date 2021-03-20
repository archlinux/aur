pkgname=python-pynndescent
pkgver=0.5.2
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="http://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-numba' 'python-scikit-learn')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('d9fd22210b8d64368376ff392e876fb72fe3cda282396cfa6a59440ab6600771')

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

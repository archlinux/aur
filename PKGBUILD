pkgname=python-pynndescent
pkgver=0.4.7
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="http://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-numba' 'python-scikit-learn')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('391a19b8422a82e01141e7b82bd168632712a497856e6f4ff347e9a4f5c87565')

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

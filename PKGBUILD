pkgname=python-ndindex
_pkgname=ndindex
pkgver=1.6
pkgrel=1
pkgdesc='Library for manipulating indices of ndarrays'
arch=('any')
url='https://quansight-labs.github.io/ndindex/'
license=('MIT')
depends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/de/97/ec37f59dae9a762623851859af5e434cac25473c6c09ef60d35020e4a2ef/$_pkgname-$pkgver.tar.gz")
sha256sums=('752e5a05c39883824316fdd7f7b650f6860eb71cecb9f15d811be2d879bebf02')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-buil
}


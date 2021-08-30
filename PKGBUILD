# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ipysheet
_pkgname=ipysheet
pkgver=0.5.0
pkgrel=1
pkgdesc="Spreadsheet in the jupyter notebook"
arch=('any')
url="https://github.com/QuantStack/ipysheet"
license=('MIT')
checkdepends=()
depends=('python-ipywidgets')
optdepends=('python-pandas')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('714804a9e6e7e413ef8e74fce026587239a853c3912060c2fcf5f8dce0b7db6c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

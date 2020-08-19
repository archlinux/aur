# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ipysheet
_pkgname=ipysheet
pkgver=0.4.4
pkgrel=1
pkgdesc="Spreadsheet in the jupyter notebook"
arch=('any')
url="https://github.com/QuantStack/ipysheet"
license=('MIT')
checkdepends=()
depends=('python-six' 'python-ipywidgets')
optdepends=('python-pandas')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('54e9dffb4384db8586d3ca6be6fd5679157f6cf98ecc9ad368fa938f889e58b2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

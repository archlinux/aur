# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ipysheet
_pkgname=ipysheet
pkgver=0.7.0
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
sha256sums=('34587a02d3bc304724126f9a6dbdf8237a04a6a7aec98a8ffbda16f93fe4ec27')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

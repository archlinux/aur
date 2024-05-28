# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ipydatagrid
_pkgname=ipydatagrid
pkgver=1.3.2
pkgrel=1
pkgdesc="Fast Datagrid widget for the Jupyter Notebook and JupyterLab"
arch=('any')
url="https://github.com/bloomberg/ipydatagrid"
license=('BSD')
depends=('python' 'python-bqplot' 'python-py2vega')
checkdepends=()
optdepends=()
makedepends=(python-installer)
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py3-none-any.whl")
sha256sums=('d557e1f037d6d46f2d4df899b57de8045aa1e1950e150e9e0146a8add90e6c2f')

package(){
  python -m installer --destdir="$pkgdir" $_pkgname-$pkgver-py3-none-any.whl
}

# vim:ts=2:sw=2:et:

# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ipydatagrid
_pkgname=ipydatagrid
pkgver=1.4.0
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
sha256sums=('1d1d1804df8ca6f07dea8e8f5e0fd9f0010af1d91f1705778f19f4d94c110fcf')

package(){
  python -m installer --destdir="$pkgdir" $_pkgname-$pkgver-py3-none-any.whl
}

# vim:ts=2:sw=2:et:

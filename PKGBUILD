# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ipydatagrid
_pkgname=ipydatagrid
pkgver=1.3.1
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
sha256sums=('6aa6e6a20705e8884a63fc802bbfb2d588302717fe20ac4b7ba0fdac04903ad5')

package(){
  python -m installer --destdir="$pkgdir" $_pkgname-$pkgver-py3-none-any.whl
}

# vim:ts=2:sw=2:et:

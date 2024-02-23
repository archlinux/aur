# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ipydatagrid
_pkgname=ipydatagrid
pkgver=1.2.1
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
sha256sums=('9736991879348fbca9b0b0fb91657f0fe7155da0a3ab1d9bb2741fad14544229')

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" ../*.whl
}

# vim:ts=2:sw=2:et:

# Maintainer: Philipp A. <flying-sheep@web.de>
_name=qgrid
pkgname=python-$_name
pkgver=1.3.1
pkgrel=1
pkgdesc='An Interactive Grid for Sorting and Filtering DataFrames in Jupyter Notebook'
arch=(any)
url='https://github.com/quantopian/qgrid'
license=(Apache)
depends=(jupyter-notebook python-pandas python-ipywidgets)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fe8af5b50833084dc0b6a265cd1ac7b837c03c0f8521150163560dce778d711c')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

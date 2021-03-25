# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-pyreadstat
_name=pyreadstat
#_pyver=3.9
pkgver=1.1.0
pkgrel=1
pkgdesc="Python package to read sas, spss and stata files into pandas data frames."
url="https://github.com/Roche/pyreadstat"
depends=('python-pandas')
makedepends=('python-setuptools' 'cython')
license=('Apache')
arch=('i686' 'x86_64')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('2f67e2c7995e07d52376415ffe5264f3')

# build() {
#     cd $srcdir/${_name}-${pkgver}
#     python setup.py build
# }

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}

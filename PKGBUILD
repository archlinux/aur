# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pytest-cython'
_pkgname='pytest-cython'
pkgver='0.1.0'
pkgrel=1
pkgdesc="A plugin for testing Cython extension modules."
url="https://github.com/lgpage/pytest-cython"
checkdepends=('python-pytest')
depends=('python')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('90fa7e4e619bababeb433d3ba173a80d20473cce0bf3dce2c0e6f298becf5998')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

#check() {
    #cd "$srcdir/$_pkgname-${pkgver}"
    #python setup.py test
#}

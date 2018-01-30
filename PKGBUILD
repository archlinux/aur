pkgbase=('python-validictory')
pkgname=('python-validictory')
_module='validictory'
pkgver='1.1.2'
pkgrel=1
pkgdesc="general purpose python data validator"
url="http://github.com/jamesturk/validictory"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/v/validictory/validictory-${pkgver}.tar.gz")
md5sums=('ee3ea24d0e5602255d618fd63487dd0f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

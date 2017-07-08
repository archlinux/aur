pkgbase=('python-april')
pkgname=('python-april')
_module='april'
pkgver='0.0.1a4'
pkgrel=1
pkgdesc="simplified data deserialization"
url="https://github.com/cosven/april"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/april/april-${pkgver}.tar.gz")
md5sums=('69fe1df51e5e09f86401bbc6570520c7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

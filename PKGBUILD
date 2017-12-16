pkgbase=('python-banal')
pkgname=('python-banal')
_module='banal'
pkgver='0.3.1'
pkgrel=1
pkgdesc="Commons of banal micro-functions for Python."
url="http://github.com/pudo/banal"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/banal/banal-${pkgver}.tar.gz")
md5sums=('f7fd8af0656f013e51c61f6799ae810f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

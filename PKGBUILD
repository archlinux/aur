pkgbase=('python-normality')
pkgname=('python-normality')
_module='normality'
pkgver='0.5.6'
pkgrel=1
pkgdesc="Micro-library to normalize text strings"
url="http://github.com/pudo/normality"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/n/normality/normality-${pkgver}.tar.gz")
md5sums=('38a71cae2dbd3f57f1fced6c0d58f186')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

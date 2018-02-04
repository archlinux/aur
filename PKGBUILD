pkgbase=('python-click-default-group')
pkgname=('python-click-default-group')
_module='click-default-group'
pkgver='1.2'
pkgrel=1
pkgdesc="Extends click.Group to invoke a command without explicit subcommand name"
url="https://github.com/sublee/click-default-group/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/click-default-group/click-default-group-${pkgver}.tar.gz")
md5sums=('4ac834c6b2fc605bedca21bdf2d02aa3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

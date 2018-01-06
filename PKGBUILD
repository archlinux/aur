# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python-hoedown')
pkgname=('python-hoedown')
_module='hoedown'
pkgver='0.2.3'
pkgrel=1
pkgdesc="The Python binding for Hoedown, a markdown parsing library."
url="https://github.com/hhatto/python-hoedown"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/h/hoedown/hoedown-${pkgver}.tar.gz")
md5sums=('cb1c5e620eb277deabb3345012bc387f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

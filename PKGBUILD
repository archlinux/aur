# Maintainer: bitwave < aur [aTt] oomlu {d0tt} de >
pkgbase=('python2-angrop')
pkgname=('python2-angrop')
_module='angrop'
pkgver='7.7.9.21'
pkgrel=1
pkgdesc="The rop chain builder based off of angr"
url=""
depends=('python2' 'python2-angr')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/angrop/angrop-${pkgver}.tar.gz")
sha256sums=('929c7d2cc188fd5747e2c965a0ed122bcf40d6f60839829e3d26af9425c43a78')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-sphinxcontrib-napoleon'
pkgname=('python-sphinxcontrib-napoleon' 'python2-sphinxcontrib-napoleon')
_module='sphinxcontrib-napoleon'
pkgver=0.7
pkgrel=2
pkgdesc='Sphinx "napoleon" extension.'
url="https://sphinxcontrib-napoleon.readthedocs.io"
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('407382beed396e9f2d7f3043fad6afda95719204a1e1a231ac865f40abcbfcf8')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-sphinxcontrib-napoleon() {
    depends=('python' 'python-sphinx' 'python-pockets')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-napoleon() {
    depends=('python2' 'python2-sphinx' 'python2-pockets')
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

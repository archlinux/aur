# Maintainer: Wil Thomason <wbthomason at cs dot cornell dot edu>

_pkgbase='python-fire'
pkgbase='python-fire'
pkgname=('python-fire' 'python2-fire')
pkgver='0.2.0'
pkgrel=1
pkgdesc='Python Fire is a library for automatically generating command line interfaces (CLIs) from
absolutely any Python object.'
arch=('any')
url='https://github.com/google/python-fire'
license=('Apache-2.0')
depends=('python' 'python2' 'python-termcolor' 'python2-termcolor')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/google/python-fire/archive/v${pkgver}.tar.gz")
sha256sums=('075d78ddc720ca88b9097b3dd17907ceb68649005f1bcbd40ff52c44ff70bb41')

package_python-fire() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-fire() {
    depends=('python2')

    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

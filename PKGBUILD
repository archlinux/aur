# Maintainer: Wil Thomason <wbthomason at cs dot cornell dot edu>

_pkgbase='python-fire'
pkgbase='python-fire'
pkgname=('python-fire' 'python2-fire')
pkgver='0.1.2'
pkgrel=1
pkgdesc='Python Fire is a library for automatically generating command line interfaces (CLIs) from
absolutely any Python object.'
arch=('any')
url='https://github.com/google/python-fire'
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/google/python-fire/archive/v${pkgver}.tar.gz")
sha256sums=('648715c17fd2e014399e498ac5941ef0b5b057696d38cfb9a31c2f6e9ac9639a')

package_python-fire() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-fire() {
    depends=('python2')

    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

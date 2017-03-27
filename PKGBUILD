# Maintainer: mdraw.gh at gmail dot com

_pkgbase='better-exceptions'
pkgbase='python-better-exceptions'
pkgname=('python-better-exceptions' 'python2-better-exceptions')
pkgver='0.1.5'
pkgrel=1
pkgdesc="Pretty and useful exceptions in Python, automatically"
arch=('any')
url='https://github.com/Qix-/better-exceptions'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
conflicts=('python-better-exceptions-git')
source=("https://github.com/Qix-/better-exceptions/archive/${pkgver}.tar.gz")
sha256sums=('3004dc50446731db317cf2ef97047f03c51b329fae0c06a27b5338415bea03d8')

package_python-better-exceptions() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-better-exceptions() {
    depends=('python2')
    conflicts=('python2-better-exceptions-git')

    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

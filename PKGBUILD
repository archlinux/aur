# Maintainer: mdraw.gh at gmail dot com

_pkgbase='better-exceptions'
pkgbase='python-better-exceptions'
pkgname=('python-better-exceptions' 'python2-better-exceptions')
pkgver='0.2.2'
pkgrel=1
pkgdesc="Pretty and useful exceptions in Python, automatically"
arch=('any')
url='https://github.com/Qix-/better-exceptions'
license=('MIT')
source=("https://github.com/Qix-/better-exceptions/archive/${pkgver}.tar.gz")
sha256sums=('92fdf2cd1a39b1db2564ea43da41a8d0de985f1cc3a755a81d74173d9260cfbc')

package_python-better-exceptions() {
    depends=('python')
    makedepends=('python-setuptools')
    conflicts=('python-better-exceptions-git')

    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-better-exceptions() {
    depends=('python2')
    makedepends=('python2-setuptools')
    conflicts=('python2-better-exceptions-git')

    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

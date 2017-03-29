# Maintainer: mdraw.gh at gmail dot com

_pkgbase='better-exceptions'
pkgbase='python-better-exceptions'
pkgname=('python-better-exceptions' 'python2-better-exceptions')
pkgver='0.1.6'
pkgrel=1
pkgdesc="Pretty and useful exceptions in Python, automatically"
arch=('any')
url='https://github.com/Qix-/better-exceptions'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
conflicts=('python-better-exceptions-git')
source=("https://github.com/Qix-/better-exceptions/archive/${pkgver}.tar.gz")
sha256sums=('81dde2a736c336cc632b8ba9669435be4ef89fa4f6a754f457bd81420c72e499')

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

# Maintainer: mdraw.gh at gmail dot com

_pkgbase='better-exceptions'
pkgbase='python-better-exceptions'
pkgname=('python-better-exceptions' 'python2-better-exceptions')
pkgver='0.1.8'
pkgrel=1
pkgdesc="Pretty and useful exceptions in Python, automatically"
arch=('any')
url='https://github.com/Qix-/better-exceptions'
license=('MIT')
source=("https://github.com/Qix-/better-exceptions/archive/${pkgver}.tar.gz")
sha256sums=('8272fafb38e09d98e136149cda2cf9ff09af3041500520f2a76db3892d91e2e3')

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

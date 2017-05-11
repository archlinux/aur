# Maintainer: mdraw.gh at gmail dot com

pkgbase='python-colorlog'
pkgname=('python-colorlog' 'python2-colorlog')
pkgver='2.10.0'
pkgrel=3
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
source=("https://github.com/borntyping/python-colorlog/archive/v${pkgver}.tar.gz")
sha256sums=('f1e3ebbb5ea218ba78d398c0e29c530a1f34d7af5436a9151faaf8f01b358d81')

package_python-colorlog() {
    depends=('python')
    makedepends=('python-setuptools')
    conflicts=('python-colorlog-git')

    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-colorlog() {
    depends=('python2')
    makedepends=('python2-setuptools')
    conflicts=('python2-colorlog-git')

    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

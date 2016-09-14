# Maintainer: mdraw.gh at gmail dot com

pkgbase='python-colorlog'
pkgname=('python-colorlog' 'python2-colorlog')
pkgver='2.7.0'
pkgrel=2
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-colorlog-git')
source=("https://github.com/borntyping/python-colorlog/archive/${pkgver}.tar.gz")
md5sums=('a39a0ab37877a0b682f493f8ce23ad0b')

package_python-colorlog() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-colorlog() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

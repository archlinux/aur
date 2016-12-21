# Maintainer: mdraw.gh at gmail dot com

pkgbase='python-colorlog'
pkgname=('python-colorlog' 'python2-colorlog')
pkgver='2.10.0'
pkgrel=1
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
conflicts=('python-colorlog-git')
source=("https://github.com/borntyping/python-colorlog/archive/v${pkgver}.tar.gz")
md5sums=('90fc0b24808f4a9bea7c9936a6842d0e')

package_python-colorlog() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-colorlog() {
    depends=('python2')
    conflicts=('python2-colorlog-git')

    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

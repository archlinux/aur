# Maintainer: mdraw.gh at gmail dot com

pkgbase='python-colorlog'
pkgname=('python-colorlog' 'python2-colorlog')
pkgver='3.1.0'
pkgrel=0
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
source=("https://github.com/borntyping/python-colorlog/archive/v${pkgver}.tar.gz")
sha256sums=('e766265cf249947f1690d5d7f4fe566a2d48a86640f6777374671aa05f6214b8')

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

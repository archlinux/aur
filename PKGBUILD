# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgbase=python-webencodings
pkgname=('python2-webencodings' 'python-webencodings')
pkgver=0.4
pkgrel=1
arch=('any')
url="https://github.com/SimonSapin/python-webencodings"
license=('BSD')
makedepends=('python2' 'python' 'unzip')
source=(https://pypi.python.org/packages/a4/1b/5add42eff950cf85ecdd3244fc7e7eef8ebb81131289ad69b8b0089f86ab/webencodings-0.4.tar.gz)
md5sums=('67812574c852836036e6cdc8a951e28f')

package_python-webencodings() {
pkgdesc="This is a Python implementation of the WHATWG Encoding standard."
depends=('python')
    cd ${srcdir}/webencodings-${pkgver}

    python3 setup.py install --root=${pkgdir}
}

package_python2-webencodings() {
pkgdesc="This is a Python implementation of the WHATWG Encoding standard."
depends=('python2')
    cd ${srcdir}/webencodings-${pkgver}

    python2 setup.py install --root=${pkgdir}
}

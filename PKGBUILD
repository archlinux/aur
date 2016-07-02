# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgbase=python-webencodings
pkgname=('python2-webencodings' 'python-webencodings')
pkgver=0.5
pkgrel=1
arch=('any')
url="https://github.com/SimonSapin/python-webencodings"
license=('BSD')
makedepends=('python2' 'python' 'python-setuptools' 'python2-setuptools')
source=(https://github.com/gsnedders/python-webencodings/archive/v$pkgver.tar.gz)
md5sums=('380cd5f79cd65620bd5b852528dce3a6')

package_python-webencodings() {
pkgdesc="This is a Python implementation of the WHATWG Encoding standard."
depends=('python')
    cd ${srcdir}/${pkgbase}-${pkgver}

    LANG="en_US.UTF-8" python3 setup.py install --root=${pkgdir}
}

package_python2-webencodings() {
pkgdesc="This is a Python implementation of the WHATWG Encoding standard."
depends=('python2')
    cd ${srcdir}/${pkgbase}-${pkgver}

    python2 setup.py install --root=${pkgdir}
}

# Maintainer: Tom Willemse <tom@ryuslash.org>

_python=python2
_name=pycommand

pkgname=$_python-pycommand
pkgver=0.3.0
pkgrel=1
pkgdesc="A clean and simplistic alternative for argparse, optparse and getopt"
depends=('python2')
makedepends=('python2-distribute')
arch=('any')
source=("http://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('2d8197b987c5096ae5646f0155f1aa1d')
url="https://pypi.python.org/pypi/pycommand"
license=('custom:ISC')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    $_python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

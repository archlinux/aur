# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python2-tzlocal
_pkgname=tzlocal
pkgver=1.3
pkgrel=1
pkgdesc="Python2 version for tzinfo object for the local timezone"
arch=('any')
url='https://pypi.python.org/pypi/tzlocal'
license=('custom:cc-0')
depends=('python2-pytz')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('3cb544b3975b59f91a793850a072d4a8')

package() {
    cd "${_pkgname}-$pkgver"
    python2 setup.py install --root="$pkgdir"
    install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

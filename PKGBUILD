# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python2-tzlocal
_pkgname=tzlocal
pkgver=1.3
pkgrel=2
pkgdesc="Python2 version for tzinfo object for the local timezone"
arch=('any')
url='https://pypi.python.org/pypi/tzlocal'
license=('custom:cc-0')
depends=('python2-pytz')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('d160c2ce4f8b1831dabfe766bd844cf9012f766539cf84139c2faac5201882ce')

package() {
    cd "${_pkgname}-$pkgver"
    python2 setup.py install --root="$pkgdir"
    install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

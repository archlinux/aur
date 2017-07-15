# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-autograd')
_pkgname='autograd'
pkgver='1.1.11'
pkgrel=1
pkgdesc="Efficiently computes derivatives of numpy code"
url="https://github.com/HIPS/autograd"
depends=('python'
    'python-numpy'
    'python-scipy')
checkdepends=()
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6a50cc28a17a1411b8e817b9c1e171e6d7a9b3fef1568622f87fe184c471b14c')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}


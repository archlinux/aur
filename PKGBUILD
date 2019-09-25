# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-autograd')
_pkgname='autograd'
pkgver='1.3'
pkgrel=1
pkgdesc="Efficiently computes derivatives of numpy code"
url="https://github.com/HIPS/autograd"
depends=('python'
    'python-future'
    'python-numpy'
    'python-scipy')
checkdepends=()
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a15d147577e10de037de3740ca93bfa3b5a7cdfbc34cfb9105429c3580a33ec4')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}


# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-autograd')
_pkgname='autograd'
pkgver='1.1.13'
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
sha256sums=('37ab7eb4bc996ae8cf0099cc429b5c437e4097e1c56c224aede28a7d8c8439d5')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}


# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-autograd')
_pkgname='autograd'
pkgver='1.2'
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
sha256sums=('a08bfa6d539b7a56e7c9f4d0881044afbef5e75f324a394c2494de963ea4a47d')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}


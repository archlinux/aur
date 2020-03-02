# Maintainer: RubenKelevra 

pkgname=python-multibase
_pkgname=py-multibase
pkgver=1.0.1
pkgrel=1
pkgdesc="Multibase implementation for Python"
url="https://github.com/multiformats/py-multibase"
depends=('python' )
license=('MIT')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('464bcccb712087c300adcbd2b7da9e5f82f77750506d74102eacf5484694fde2ec8c4cbbf73fd729d082f44e7e7ecfe6e91d90d83479d6b4bd304b6661442093')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}

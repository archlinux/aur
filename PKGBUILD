#Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase=('python-django-model-utils')
pkgname=('python-django-model-utils')
_module='django-model-utils'
pkgver='2.4'
pkgrel=1
pkgdesc="Django model mixins and utilities"
url="https://github.com/carljm/django-model-utils/"
depends=('python-django')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-model-utils/django-model-utils-${pkgver}.tar.gz")
md5sums=('6bef27d0ef53a2132b86825921c3b0da')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

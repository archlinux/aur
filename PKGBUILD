#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-sortedm2m')
pkgname=('python-django-sortedm2m')
_module='django-sortedm2m'
pkgver='1.1.1'
pkgrel=1
pkgdesc="Drop-in replacement for django's many to many field with sorted relations."
url="http://github.com/gregmuellegger/django-sortedm2m"
depends=('python-django')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-sortedm2m/django-sortedm2m-${pkgver}.tar.gz")
sha256sums=('d38d201da8593c94c8706f9ef30e3203bf0d352d6264abbb7babfbb112f86cb4')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

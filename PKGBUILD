#Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase=('python-django-markitup')
pkgname=('python-django-markitup')
_module='django-markitup'
pkgver='2.3.0'
pkgrel=1
pkgdesc="Markup handling for Django using the MarkItUp! universal markup editor"
url="https://github.com/zsiciarz/django-markitup"
depends=('python-django' 'jquery')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-markitup/django-markitup-${pkgver}.tar.gz")
sha256sums=('89164fe1cde7d08af18b3a4f948b32fa9202d1731e2f267bd2de89d2da92560b')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

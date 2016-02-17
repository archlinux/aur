#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-markitup')
pkgname=('python-django-markitup')
_module='django-markitup'
pkgver='2.3.1'
pkgrel=1
pkgdesc="Markup handling for Django using the MarkItUp! universal markup editor"
url="https://github.com/zsiciarz/django-markitup"
depends=('python-django' 'jquery' 'python-markdown')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-markitup/django-markitup-${pkgver}.tar.gz")
sha256sums=('8d974663c64e155befebe12dd175c7a414c985b0577e8a629d40691a2e26ea10')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

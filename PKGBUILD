#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-angular')
pkgname=('python-django-angular')
_module='django-angular'
pkgver='0.8.0'
pkgrel=1
pkgdesc="Let Django play well with AngularJS"
url="https://github.com/jrief/django-angular"
depends=('python')
makedepends=('python-setuptools' 'python-django' 'angularjs')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-angular/django-angular-${pkgver}.tar.gz")
sha256sums=('3f593700240fc089212d676d6f9a512630421865ee66beaa1f537f44ae9d622d')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

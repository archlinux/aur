#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-angular')
pkgname=('python-django-angular')
_module='django-angular'
pkgver='0.8.1'
pkgrel=1
pkgdesc="Let Django play well with AngularJS"
url="https://github.com/jrief/django-angular"
depends=('python')
makedepends=('python-setuptools' 'python-django' 'angularjs')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-angular/django-angular-${pkgver}.tar.gz")
sha256sums=('5b74332564d18e25e78bf0c1c599a15dcd218d329140e162d1870db2a3919137')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-angular')
pkgname=('python-django-angular')
_module='django-angular'
pkgver='0.7.15'
pkgrel=1
pkgdesc="Let Django play well with AngularJS"
url="https://github.com/jrief/django-angular"
depends=('python')
makedepends=('python-setuptools' 'python-django' 'angularjs')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-angular/django-angular-${pkgver}.tar.gz")
sha256sums=('d5d77d0fc5a0be7f445973e318ed8a5f242cc172c4870127cfa564316eac3124')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

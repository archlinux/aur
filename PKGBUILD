#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-angular')
pkgname=('python-django-angular')
_module='django-angular'
pkgver='0.7.16'
pkgrel=1
pkgdesc="Let Django play well with AngularJS"
url="https://github.com/jrief/django-angular"
depends=('python')
makedepends=('python-setuptools' 'python-django' 'angularjs')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-angular/django-angular-${pkgver}.tar.gz")
sha256sums=('ec2908839e3c37e54f32e755e85d5e37d4cb020bd22edd5597d2761f40c2be4b')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

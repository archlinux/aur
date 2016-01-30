# Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase=('python-django-angularjs')
pkgname=('python-django-angularjs')
_module='django-angularjs'
pkgver='1.0.2'
pkgrel=1
pkgdesc="Angularjs packaged in a handy django app to speed up new applications and reduce duplicaiton."
url="https://github.com/graingert/django-static-libs/tree/master/angular-1.0.2"
depends=('python')
makedepends=('python-setuptools', 'python-django', 'angularjs')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-angularjs/django-angularjs-${pkgver}.tar.gz")
md5sums=('1852af0dc10845aba818b5e25039e35a')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

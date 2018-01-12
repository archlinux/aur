
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.3.0
_pkgver=1.3.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-setuptools')
source=(https://bitbucket.org/psagers/django-auth-ldap/get/$_pkgver.tar.bz2)
md5sums=('e9790d0d7baeb26273364fcd37d6ee44')

package() {
  cd psagers-django-auth-ldap*
  python setup.py build
  python setup.py install --root=$pkgdir 
}

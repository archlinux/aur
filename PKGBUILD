
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.2.13
_pkgver=1.2.13
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-setuptools')
source=(https://bitbucket.org/psagers/django-auth-ldap/get/$_pkgver.tar.bz2)
md5sums=('15403051da946e509d3bea081e988693')

package() {
  cd psagers-django-auth-ldap*
  python setup.py build
  python setup.py install --root=$pkgdir 
}

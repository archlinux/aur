
pkgname=python2-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.3.0
_pkgver=1.3.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python2' 'python2-django')
makedepends=('python2-setuptools')
source=(https://files.pythonhosted.org/packages/32/67/f13dcca1aae0fa6ae06d36a73137cfe80b67ed7c52fd75b5d76480c665b1/$_pkgname-$_pkgver.tar.gz)
md5sums=('28c82540580b08388fe56082b152f82f')

package() {
  cd "$_pkgname-$_pkgver"
  python2 setup.py build
  python2 setup.py install --root=$pkgdir 
}

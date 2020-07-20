
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=2.2.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-setuptools')
source=("https://github.com/django-auth-ldap/django-auth-ldap/archive/$pkgver.tar.gz")
md5sums=('d8d76eead85a8083e46faf763446a7ea')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}

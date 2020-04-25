
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=2.1.1
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-setuptools')
source=("https://github.com/django-auth-ldap/django-auth-ldap/archive/$pkgver.tar.gz")
md5sums=('586e5ddf652a6bd05d313264f193ef4f')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}

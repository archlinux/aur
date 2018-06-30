
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.6.1
_pkgver=1.6.1
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/c6/ae/531e3577427d7aa6b296ef52668838bfddd3eafc4f3976afb8f940ec5bfb/django-auth-ldap-1.6.1.tar.gz)
md5sums=('840a31a20f82978eaded84990648dcbd')

package() {
  cd "$_pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}

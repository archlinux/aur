
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.7.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/38/80/ee5f4322ffa91ff2779141fc7b151b413e4c07b7cb2bb336487cae641c0c/django-auth-ldap-1.7.0.tar.gz)
md5sums=('bb85e5e50ea179781244df580ee5b0f0')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}


pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.5.0
_pkgver=1.5.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/0f/d8/5295b55c12b99173a01a960fd0027548f995230714b8f636499bdf76e1fa/django-auth-ldap-1.5.0.tar.gz)
md5sums=('519ef7b44de31a4b4c113b517fce0e02')

package() {
  cd "$_pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}

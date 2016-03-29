
pkgname=python2-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.2.7
_pkgver=1.2.7
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python2' 'python2-django')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/d/django-auth-ldap/$_pkgname-$_pkgver.tar.gz)
md5sums=('faec4c18ac1257861b299af8b22023e0')

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python2 setup.py build
  python2 setup.py install --root=$pkgdir 
}

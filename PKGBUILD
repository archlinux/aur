
pkgname=python2-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=1.2.6
_pkgver=1.2.6
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python2' 'python2-django')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/d/django-auth-ldap/$_pkgname-$_pkgver.tar.gz)
md5sums=('20096f0780823d73a0b839b7a31a0e60')

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python2 setup.py build
  python2 setup.py install --root=$pkgdir 
}

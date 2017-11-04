# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=python-wsgi-intercept
_pkgname=wsgi_intercept
pkgver=1.5.1
pkgrel=1
pkgdesc='Installs a WSGI application in place of a real URI for testing.'
arch=('any')
url='http://code.google.com/p/wsgi-intercept/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

md5sums=('6ce3e56a93313ae88e7e0a98b35044ba')

package() {
  cd "$srcdir/wsgi_intercept-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

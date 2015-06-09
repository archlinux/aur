# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=python2-wsgi-intercept
pkgver=0.8.1
pkgrel=1
pkgdesc='Installs a WSGI application in place of a real URI for testing'
arch=('i686' 'x86_64')
url='http://code.google.com/p/wsgi-intercept/'
license=('MIT')
depends=('python2')
source=("http://pypi.python.org/packages/source/w/wsgi_intercept/wsgi_intercept-$pkgver.tar.gz")
md5sums=('791abe4c1c7200dc5e205163acc9d110')

package() {
  cd "$srcdir/wsgi_intercept-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

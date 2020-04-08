# Maintainer: Adam Goldsmith <adam@adamgoldsmith.name>

_name=oauth2client
pkgname=python2-$_name
pkgver=4.1.3
pkgrel=1
pkgdesc="OAuth 2.0 client library"
arch=(any)
url="https://github.com/googleapis/oauth2client"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('3a9eb781f685949c04946f6c09e4c11d')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:

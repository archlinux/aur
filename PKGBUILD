# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-postorius')
_commit=e3e087fe0a52f30959e6fa79896342d7615e1f9d
pkgver=1.1.2
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman"
arch=(any)
makedepends=('python2-setuptools')
depends=('python2' 'python2-django-mailman3')
url="https://gitlab.com/mailman/postorius"
license=('LGPL')
options=(!emptydirs)
source=("postorius-${pkgver}.tar.gz::https://gitlab.com/mailman/postorius/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('acf48c5ec772c9815c4ecf620b71a17121d5c7b43754f86e3cd0d8cee6fdb621')

package() {
  cd "$srcdir/postorius-$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

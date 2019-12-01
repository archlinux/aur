# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python-django-postorius')
_commit=389aaf1d89824474cb31b30515cd6b1ee2c520a0
pkgver=1.3.0
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman"
arch=(any)
makedepends=('python-setuptools')
depends=('python' 'python-django-mailman3')
url="https://gitlab.com/mailman/postorius"
license=('LGPL')
options=(!emptydirs)
source=("postorius-${pkgver}.tar.gz::https://gitlab.com/mailman/postorius/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('5cc8cf50fe7a40a98483bf38434ce60f86741371abdedc9155eb9008e69e60c6')

package() {
  cd "$srcdir/postorius-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

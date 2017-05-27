# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-postorius')
_commit=52c9c3a5c630a59e88ff88ba0c7d66881e5b805d
pkgver=1.1.0
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman"
arch=(any)
makedepends=('python2-setuptools')
depends=('python2' 'python2-django-mailman3')
url="https://gitlab.com/mailman/postorius"
license=('LGPL')
options=(!emptydirs)
source=("postorius-${pkgver}.tar.gz::https://gitlab.com/mailman/postorius/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('a67e374cebf8d8bb501dafc4f6a0137157ab29ed37743f0954900bfb30fa56de')

package() {
  cd "$srcdir/postorius-$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-mailman3')
pkgver="1.1.0"
_commit="c86e9dccc8b3a10b65a5ebd9dc523d7676098c36"
pkgrel=1
pkgdesc="Django library to help interaction with Mailman"
arch=(any)
depends=('python2' 'python2-django' 'python2-django-allauth' 'python2-future'
         'python2-mailmanclient' 'python2-pytz' 'python2-django-gravatar')
url="https://gitlab.com/mailman/django-mailman3"
license=('GPLv3')
options=(!emptydirs)
source=("https://gitlab.com/mailman/django-mailman3/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('853cfa0969b5cea15ff26f3133977f6189c32d55dfcd7d38e018c8dfeb5cd1c1')

package() {
  cd "${srcdir}/django-mailman3-${pkgver}-${_commit}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python-django-mailman3')
pkgver="1.3.0"
_commit="93127c004cde66e2e1a7551932add0d20f6e8733"
pkgrel=1
pkgdesc="Django library to help interaction with Mailman"
arch=(any)
depends=('python' 'python-django' 'python-django-allauth'
         'python-mailmanclient' 'python-pytz' 'python-django-gravatar')
url="https://gitlab.com/mailman/django-mailman3"
license=('GPLv3')
options=(!emptydirs)
source=("https://gitlab.com/mailman/django-mailman3/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('74f671f809f34de5919aef23dc63685c3c4ba1c651431c98e2272726f0ef5177')

package() {
  cd "${srcdir}/django-mailman3-${pkgver}-${_commit}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

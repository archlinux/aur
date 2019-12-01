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
sha256sums=('3b870fcaf7b92b73a0af2a9bc05c4b50b5242fea50568c5eb8bf968fd0ac7088')

package() {
  cd "${srcdir}/django-mailman3-${pkgver}-${_commit}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

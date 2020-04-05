# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgname=python-django-tables2
pkgver=2.2.1
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
options=(!emptydirs)
depends=('python-django>=1.11')
makedepends=(python-setuptools)
optdepends=('python-tablib: to export table data as CSV, XLS, etc.')
source=("https://github.com/bradleyayers/django-tables2/archive/v${pkgver}.tar.gz")
sha256sums=('ec0112ebebda943fee141ab836a336ec74120214a576bbf4e9ffb584888674f9')

package() {
  cd "${srcdir}/django-tables2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

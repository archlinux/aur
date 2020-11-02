# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgname=python-django-tables2
pkgver=2.3.3
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
sha256sums=('7f405ea5104adec60b7f9dfc397ec0de312b3f0b8e403fcd5d9505197c9226e6')

package() {
  cd "${srcdir}/django-tables2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

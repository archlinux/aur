# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Simon Hollingshead <me at [firstnamelastname] dot com>

set -u
pkgname='hypercalc'
pkgver='20150124'
pkgrel='1'
pkgdesc='A calculator designed to calculate extremely large numbers without overflowing.'
arch=('any')
url='http://mrob.com/pub/perl/hypercalc.html'
license=('GPL')
depends=('perl')
source=("http://mrob.com/pub/comp/${pkgname}/${pkgname}.txt")
sha256sums=('9db69045904a1c2f715b9e2ab78888fdcdf32d33b4cb4683511811edfb9fe89a')

package() {
  set -u
  mkdir -p "${pkgdir}/usr/bin"
  install -T "${srcdir}/${pkgname}.txt" "${pkgdir}/usr/bin/${pkgname}"
  set +u
}
set +u

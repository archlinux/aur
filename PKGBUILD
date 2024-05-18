#Maintainer: dreieck

_pkgname=unison
_pkgver=2.48.4
pkgname="${_pkgname}-${_pkgver}"
pkgver="${_pkgver}"
pkgrel=2
pkgdesc="Makes the specific version ${_pkgver} of ${_pkgname} available as default ${_pkgname}."
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'any'
)
license=('GPL2')
depends=(
  "${_pkgname}-${_pkgver}-compat"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

package() {
  install -d -m755 "${pkgdir}"/usr/bin
  cd "${pkgdir}"/usr/bin
  ln -s "unison-${_pkgver}" "unison"
}

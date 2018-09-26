# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=chartjs
_script=Chart.js
_scriptmin=Chart.min.js
pkgver=2.7.2
pkgrel=1
pkgdesc="Simple HTML5 Charts using the canvas element"
arch=(any)
url="http://www.chartjs.org"
license=('MIT')
source=("https://github.com/${pkgname}/${_script}/releases/download/v${pkgver}/${_script}" "https://github.com/${pkgname}/${_script}/releases/download/v${pkgver}/${_scriptmin}") 
md5sums=('995971f2a1bbcf30024b53115d945330' 'f6c8efa65711e0cbbc99ba72997ecd0e')

package() {
  cd "${srcdir}"
  install -Dm644 "${_scriptmin}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}" "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:

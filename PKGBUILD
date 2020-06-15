# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=chartjs
_script=Chart.js
_scriptmin=Chart.min.js
pkgver=2.9.3
pkgrel=1
pkgdesc="Simple HTML5 Charts using the canvas element"
arch=(any)
url="http://www.chartjs.org"
license=('MIT')
source=("https://github.com/${pkgname}/${_script}/releases/download/v${pkgver}/${_script}" "https://github.com/${pkgname}/${_script}/releases/download/v${pkgver}/${_scriptmin}") 
md5sums=('aa0d045c7eefcedf60a4e27a6c613d19' 'b5c2301eb15826bf38c9bdcaa3bbe786')

package() {
  cd "${srcdir}"
  install -Dm644 "${_scriptmin}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}" "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:

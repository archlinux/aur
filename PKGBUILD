# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=chartjs
_script=Chart.js
_scriptmin=Chart.min.js
pkgver=2.7.1
pkgrel=1
pkgdesc="Simple HTML5 Charts using the canvas element"
arch=(any)
url="http://www.chartjs.org"
license=('MIT')
source=("https://github.com/${_script}/releases/download/${pkgver}/${_script}" "https://github.com/${_script}/releases/download/${pkgver}/${_scriptmin}") 
md5sums=('075de657c03483e461e9f399e1b20644' '3b2fd01c6f541703143a6e67d20d72e6')

package() {
  cd "${srcdir}"
  install -Dm644 "${_scriptmin}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}" "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:

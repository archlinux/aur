# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=chartjs
_script=Chart.js
_scriptmin=Chart.min.js
pkgver=4.5.0
pkgrel=2
pkgdesc="Simple HTML5 Charts using the canvas element"
arch=(any)
url="http://www.chartjs.org"
license=('MIT')
source=("https://github.com/${pkgname}/${_script}/releases/download/v${pkgver}/${_script}")
md5sums=('c52bf63ae2f06076876a488aa608772a')

package() {
  cd "${srcdir}"
  install -Dm644 "${_scriptmin}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}" "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:

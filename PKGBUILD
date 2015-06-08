# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=chartjs
_script=Chart.js
_scriptmin=Chart.min.js
pkgver=0.1
pkgrel=5
pkgdesc="Simple HTML5 Charts using the canvas element"
arch=(any)
url="http://www.chartjs.org"
license=('MIT')
source=("https://raw.github.com/nnnick/${_script}/master/${_script}" "https://raw.github.com/nnnick/${_script}/master/${_scriptmin}")
md5sums=('056159bd669cc625e0a3591cccb6d92b'
         '40db8115a035daf1ed6cc9d626e34dcb')

package() {
  cd "${srcdir}"
  install -Dm644 "${_scriptmin}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}" "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:

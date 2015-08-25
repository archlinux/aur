# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=chartjs
_script=Chart.js
_scriptmin=Chart.min.js
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple HTML5 Charts using the canvas element"
arch=(any)
url="http://www.chartjs.org"
license=('MIT')
source=("https://raw.githubusercontent.com/nnnick/${_script}/master/${_script}" "https://raw.githubusercontent.com/nnnick/${_script}/master/${_scriptmin}")
md5sums=('3d9055e69acd17fe0e8e3050883a2fb1'
         '7d8fd0c1dc6732675a1bd453a3f643a1')

package() {
  cd "${srcdir}"
  install -Dm644 "${_scriptmin}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}" "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:

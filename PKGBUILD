# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=underscorejs
_script=underscore
pkgver=1.10.2
pkgrel=2
pkgdesc="Underscore is a utility-belt library for JavaScript that provides a lot of the functional programming support that you would expect in Prototype.js (or Ruby), but without extending any of the built-in JavaScript objects."
arch=(any)
url=http://underscorejs.org
license=('MIT')
source=("${url}/${_script}.js" "${url}/${_script}-min.js")
md5sums=('3426062510c3cd72e1ab621e16a33b22'
  '52caef864228e0b4ca9f97eced0ab2bb')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}-min.js" "${pkgdir}/usr/share/${pkgname}/${_script}-min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
}

# vim:set ts=2 sw=2 et:

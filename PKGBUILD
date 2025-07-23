# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=underscorejs
_script=underscore-esm
pkgver=1.13.7
pkgrel=1
pkgdesc="Underscore is a utility-belt library for JavaScript that provides a lot of the functional programming support that you would expect in Prototype.js (or Ruby), but without extending any of the built-in JavaScript objects."
arch=(any)
url=https://underscorejs.org
license=('MIT')
source=("${url}/${_script}.js" "${url}/${_script}-min.js")
md5sums=('a436fc54ca3d08a9af7201b1d24c8a83'
  '1cbd21ca52e36a47077477d90df1e88c')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}-min.js" "${pkgdir}/usr/share/${pkgname}/${_script}-min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
}

# vim:set ts=2 sw=2 et:

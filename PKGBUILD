# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=underscorejs
_script=underscore
pkgver=1.8.1
pkgrel=1
pkgdesc="Underscore is a utility-belt library for JavaScript that provides a lot of the functional programming support that you would expect in Prototype.js (or Ruby), but without extending any of the built-in JavaScript objects."
arch=(any)
url=http://underscorejs.org
license=('MIT')
source=("${url}/${_script}.js" "${url}/${_script}-min.js" "${url}/LICENSE")
md5sums=('1342e4e38bce39f225510109c8dc019f'
  '6959908db2ddae758885b6c2cb2f07a5'
  'e5cfca0461b21ca314a0088fd5b2a236')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_script}-min.js" "${pkgdir}/usr/share/${pkgname}/${_script}-min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

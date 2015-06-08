# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=handlebars
pkgver=1.0.0
pkgrel=8
pkgdesc="Handlebars.js is an extension to the Mustache templating language created by Chris Wanstrath. Handlebars.js and Mustache are both logicless templating languages that keep the view and the code separated like we all know they should be."
arch=(any)
url="http://handlebarsjs.com"
license=('MIT')
depends=('nodejs')
optdepends=('nodejs-optimist')
source=("https://raw.github.com/wycats/${pkgname}.js/${pkgver}/dist/${pkgname}.js" "https://raw.github.com/wycats/${pkgname}.js/${pkgver}/bin/${pkgname}" "https://raw.github.com/wycats/${pkgname}.js/${pkgver}/LICENSE")
md5sums=('6f95155fd6469590d96c9651ee156795'
         '30978ded6d8d63531dd6fa7bd99e0c03'
         'a2163f3c5de1e75a2210655d3448d598')

package() {
  cd "${srcdir}"
#  mkdir -p "${pkgdir}/usr/share/${pkgname}"
#  mkdir -p "${pkgdir}/usr/bin"
#  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgname}.js" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

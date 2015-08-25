# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=handlebars
pkgver=v3.0.3
pkgrel=1
pkgdesc="Handlebars.js is an extension to the Mustache templating language created by Chris Wanstrath. Handlebars.js and Mustache are both logicless templating languages that keep the view and the code separated like we all know they should be."
arch=(any)
url="http://handlebarsjs.com"
license=('MIT')
depends=('nodejs')
optdepends=('nodejs-optimist')
source=("http://builds.handlebarsjs.com.s3.amazonaws.com/${pckname}-${pkgver}.js", "http://builds.handlebarsjs.com.s3.amazonaws.com/${pckname}.runtime-${pkgver}.js"
md5sums=('26161aef7f4d10f0c21adc7c183c0c1b'
  '7ae2ab0c40c56dca97c1add08d32561e')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}-${pkgver}.js" "${pkgdir}/usr/bin/${pkgname}.js"
  install -Dm755 "${pkgname}.runtime-${pkgver}.js" "${pkgdir}/usr/bin/${pkgname}.runtime.js"
}

# vim:set ts=2 sw=2 et:

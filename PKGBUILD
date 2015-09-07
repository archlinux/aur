# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
pkgname=handlebars
pkgver=v4.0.2
pkgrel=1
pkgdesc="Handlebars.js is an extension to the Mustache templating language created by Chris Wanstrath. Handlebars.js and Mustache are both logicless templating languages that keep the view and the code separated like we all know they should be."
arch=(any)
url="http://handlebarsjs.com"
license=('MIT')
depends=('nodejs')
optdepends=('nodejs-optimist')
source=("http://builds.handlebarsjs.com.s3.amazonaws.com/${pkgname}-${pkgver}.js" "http://builds.handlebarsjs.com.s3.amazonaws.com/${pkgname}.runtime-${pkgver}.js")
md5sums=('5afd2f949524fbf9a543fe7259e605e7' '7328b11edac98c70ef2f93990183b068')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}-${pkgver}.js" "${pkgdir}/usr/bin/${pkgname}.js"
  install -Dm755 "${pkgname}.runtime-${pkgver}.js" "${pkgdir}/usr/bin/${pkgname}.runtime.js"
}

# vim:set ts=2 sw=2 et:

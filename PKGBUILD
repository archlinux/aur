# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=sake-app
pkgver=0.3.0
pkgrel=1
pkgdesc="Web application that generate new sub-addresses for the SAKE OpenSMTPD filter"
arch=('any')
url="https://github.com/breard-r/sake-app"
license=('Apache' 'MIT')
source=("https://github.com/breard-r/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.gz")
sha256sums=('a31ad41373743470c8d7b1b426b766e4ac2fb3fb151aabb515808d7dca7aa5f0')

package() {
  cd "${pkgname}_v${pkgver}"
  install -Dm644 "index.html" "${pkgdir}/usr/share/webapps/${pkgname}/index.html"
  install -Dm644 "assets/sake.min.css" "${pkgdir}/usr/share/webapps/${pkgname}/assets/sake.min.css"
  install -Dm644 "assets/sake.min.wasm" "${pkgdir}/usr/share/webapps/${pkgname}/assets/sake.min.wasm"
  install -Dm644 "assets/index.js" "${pkgdir}/usr/share/webapps/${pkgname}/assets/index.js"
}

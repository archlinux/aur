# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=sake-app
pkgver=0.2.0
pkgrel=1
pkgdesc="Web application that generate new sub-addresses for the SAKE OpenSMTPD filter"
arch=('any')
url="https://github.com/breard-r/sake-app"
license=('Apache' 'MIT')
source=("https://github.com/breard-r/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.gz")
sha256sums=('4b5187cb44214f1d42bb54777629841dfb74542625e63fceaf7372e96a0b44b1')

package() {
  cd "${pkgname}_v${pkgver}"
  install -Dm644 "index.html" "${pkgdir}/usr/share/webapps/${pkgname}/index.html"
  install -Dm644 "assets/sake.min.css" "${pkgdir}/usr/share/webapps/${pkgname}/assets/sake.min.css"
  install -Dm644 "assets/sake.min.wasm" "${pkgdir}/usr/share/webapps/${pkgname}/assets/sake.min.wasm"
  install -Dm644 "assets/index.js" "${pkgdir}/usr/share/webapps/${pkgname}/assets/index.js"
}

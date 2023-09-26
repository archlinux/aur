# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=sake-app
pkgver=0.4.0
pkgrel=1
pkgdesc="Web application that generate new sub-addresses for the SAKE OpenSMTPD filter"
arch=('any')
url="https://github.com/breard-r/sake-app"
license=('Apache' 'MIT')
source=("https://git.what.tf/rodolphe/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.gz")
sha256sums=('fae8b28c0a9550fabb80d23d9151048c823d0e8038fae6313a9c278ae5aaba97')

package() {
  cd "${pkgname}_v${pkgver}"
  install -Dm644 "index.html" "${pkgdir}/usr/share/webapps/${pkgname}/index.html"
  install -Dm644 "assets/sake.min.css" "${pkgdir}/usr/share/webapps/${pkgname}/assets/sake.min.css"
  install -Dm644 "assets/sake.min.wasm" "${pkgdir}/usr/share/webapps/${pkgname}/assets/sake.min.wasm"
  install -Dm644 "assets/index.js" "${pkgdir}/usr/share/webapps/${pkgname}/assets/index.js"
  install -Dm644 "LICENSE-APACHE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0.txt"
  install -Dm644 "LICENSE-MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
}

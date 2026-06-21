# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-caddy
pkgver=0.1.2
pkgrel=1
pkgdesc="Caddy reverse proxy management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-caddy"
license=('MIT')
depends=('cockpit')
optdepends=('caddy: the reverse proxy server this plugin manages')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('78e906809d66510ee2dac19933facc10c4e48238aca31569297b360503ab5ec1')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
}

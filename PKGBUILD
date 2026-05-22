# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-compose
pkgver=0.5.0
pkgrel=1
pkgdesc="Docker Compose management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-compose"
license=('MIT')
depends=('cockpit')
optdepends=('docker: container runtime with Compose plugin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('300b8b554a0dbd5fbc60d7a5607a34d7a25944a5629ad249e83ba16c0a9e9e22')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
}

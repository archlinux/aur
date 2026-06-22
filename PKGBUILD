# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-compose
pkgver=0.10.0
pkgrel=1
pkgdesc="Docker Compose management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-compose"
license=('MIT')
depends=('cockpit')
optdepends=('docker: container runtime with Compose plugin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6f6fa3b398f0de1167287b938e6b4d5e899db987b475306435daa509aeb194b5')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
}

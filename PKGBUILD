# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-caddy
pkgver=0.1.0
pkgrel=1
pkgdesc="Caddy reverse proxy management plugin for Cockpit"
arch=('any')
url="https://github.com/RXTX4816/cockpit-caddy"
license=('MIT')
depends=('cockpit')
optdepends=('caddy: the reverse proxy server this plugin manages')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1edf9e343eeda71665cb93a9f93e6f125c965ee8f59db6e3c46296fa61694aa1')

package() {
    install -d "${pkgdir}/usr/share/cockpit/${pkgname}"
    install -m 0644 "${pkgname}/main.js"       "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/main.css"      "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/manifest.json" "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/index.html"    "${pkgdir}/usr/share/cockpit/${pkgname}/"
    install -m 0644 "${pkgname}/README.md"     "${pkgdir}/usr/share/cockpit/${pkgname}/"
}

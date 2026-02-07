# Maintainer: Marcello <marcello dot urbani at gmail dot com>
pkgname=vibing-steampunk-bin
pkgver=2.26.0
pkgrel=1
pkgdesc="ADT to MCP bridge - AI-Agentic Development for ABAP (ECC, S/4HANA)"
arch=('x86_64')
url="https://github.com/oisee/vibing-steampunk"
license=('MIT')
provides=('vsp')
conflicts=('vsp')
source=("${pkgname}-${pkgver}::https://github.com/oisee/vibing-steampunk/releases/download/v${pkgver}/vsp-linux-amd64")
sha256sums=('98642f9429df1faf6962d8d47b311f9b2fe60825360900227f7974d11dd690bc')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/vsp"
}

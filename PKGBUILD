# Maintainer: Marcello <marcello dot urbani at gmail dot com>
pkgname=vibing-steampunk-bin
pkgver=2.21.0
pkgrel=1
pkgdesc="ADT to MCP bridge - AI-Agentic Development for ABAP (ECC, S/4HANA)"
arch=('x86_64')
url="https://github.com/oisee/vibing-steampunk"
license=('MIT')
provides=('vsp')
conflicts=('vsp')
source=("${pkgname}-${pkgver}::https://github.com/oisee/vibing-steampunk/releases/download/v${pkgver}/vsp-linux-amd64")
sha256sums=('54963d2bf8a16dec990e808bc19351abacea1d91583e624b56db182b80699985')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/vsp"
}

# Maintainer: Marcello <marcello dot urbani at gmail dot com>
pkgname=vibing-steampunk-bin
pkgver=2.37.0
pkgrel=1
pkgdesc="ADT to MCP bridge - AI-Agentic Development for ABAP (ECC, S/4HANA)"
arch=('x86_64')
url="https://github.com/oisee/vibing-steampunk"
license=('MIT')
provides=('vsp')
conflicts=('vsp')
source=("${pkgname}-${pkgver}::https://github.com/oisee/vibing-steampunk/releases/download/v${pkgver}/vsp-linux-amd64")
sha256sums=('72e1c94f197089dda31872d0f36304002ec81f7180231e199a7d251fa9ae6e9a')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/vsp"
}

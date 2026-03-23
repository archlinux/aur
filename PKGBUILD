# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Contributor: franklupo <franklupog@gmail.com>
# Project : https://github.com/Corsinvest/cv4pve-vdi
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-vdi
pkgver=1.2.0
pkgrel=1
pkgdesc="VDI client for Proxmox VE — SPICE and RDP remote console launcher"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-vdi"
license=('MIT')
depends=()
provides=('cv4pve-vdi')
conflicts=('cv4pve-vdi')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-vdi/releases/download/v${pkgver}/cv4pve-vdi-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-vdi/releases/download/v${pkgver}/cv4pve-vdi-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-vdi/releases/download/v${pkgver}/cv4pve-vdi-linux-arm.zip")

sha256sums_x86_64=('6370520dd993cf380acdd741b7c19f6da4991e39e79a5d2f57961dc192f428a6')
sha256sums_aarch64=('60f5d6423b0e519a380e1b4fc6c267f5e0948a17f0bda479b06e11e1243fc206')
sha256sums_armv7h=('fb35734b97ee1b02015b417d363eafebcdb47e65abc988a85a42cccaf3c86711')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

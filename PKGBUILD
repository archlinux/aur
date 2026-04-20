# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-node-protect
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-node-protect
pkgver=2.1.1
pkgrel=1
pkgdesc="Backup Proxmox VE node configuration files via SSH"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-node-protect"
license=('GPLv3')
depends=()
provides=('cv4pve-node-protect')
conflicts=('cv4pve-node-protect')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-node-protect/releases/download/v${pkgver}/cv4pve-node-protect-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-node-protect/releases/download/v${pkgver}/cv4pve-node-protect-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-node-protect/releases/download/v${pkgver}/cv4pve-node-protect-linux-arm.zip")

sha256sums_x86_64=('3921d539c5d88d3642166a627e04d20238de96aefc2d9492c454cf7ea11e9c7d')
sha256sums_aarch64=('fefe690cb490c6e76e34e12ba241c9b9e6f40a17b63b0310bee4f9d51ce4b49c')
sha256sums_armv7h=('d5bd60b1d129765d50d404ae522952612636bb2e561e95db67daf36e28d2f72f')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

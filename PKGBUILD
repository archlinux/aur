# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-node-protect
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-node-protect
pkgver=2.0.0
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

sha256sums_x86_64=('8a7f2738e890dde9c15d33566749422ab43d7e18ca01d90dc89da09376b99d57')
sha256sums_aarch64=('ff60dd81ddb4a3d713790606532358fe943e099e413614f49b1a32c04bdc968b')
sha256sums_armv7h=('05fc83182e0e2239c9c0bc130c25e8143869f9f130678d02e6732723d9c9aa7a')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

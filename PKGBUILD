# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-node-protect
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-node-protect
pkgver=2.2.0
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

sha256sums_x86_64=('151b0a45233f3eb767331aa19c8ae31f6a6e94a40f94f33eed099f497261b326')
sha256sums_aarch64=('962d984091cd312acfecb57ab2c31609b9168e666187bc7c056b4c98a6d9316d')
sha256sums_armv7h=('d862c145176a4e2c629b4e8ae275dabf87c73defe8832408ff56105d9c90f239')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

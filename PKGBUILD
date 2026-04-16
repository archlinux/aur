# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-node-protect
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-node-protect
pkgver=2.0.1
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

sha256sums_x86_64=('40806d139c488d4a35f3fe6c26e29f3463dfcb8c77330c7380323ded6971d2b7')
sha256sums_aarch64=('35363c3112ffb25a845bb7716ad48a8733c171982426a840270a0f9287dd8a73')
sha256sums_armv7h=('a2a4d024a57603cd659d6662089d1b5c3bdd52217f648ba455953f5037bca9da')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-autosnap
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-autosnap
pkgver=2.1.1
pkgrel=1
pkgdesc="Automatic snapshot tool for Proxmox VE — schedule and manage VM/LXC snapshots with retention policies"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-autosnap"
license=('GPLv3')
depends=()
provides=('cv4pve-autosnap')
conflicts=('cv4pve-autosnap')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-arm.zip")

sha256sums_x86_64=('66ab53c45e31d070906bdb64791cbb03fd52a7a5872b281b3598c7f65e2bc44a')
sha256sums_aarch64=('704c40286a6c17f589fcc0c2cb553770e4c0fa1c50b332a2a0a960f255238c9d')
sha256sums_armv7h=('9a4f359de26f735061937354fdaf99bf31b67db9418fe0e5774fe8f3687d13ea')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

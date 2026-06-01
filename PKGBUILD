# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-diag
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-diag
pkgver=2.4.0
pkgrel=1
pkgdesc="Diagnostic tool for Proxmox VE — checks nodes, VMs, LXC containers and storage for common issues"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-diag"
license=('GPLv3')
depends=()
provides=('cv4pve-diag')
conflicts=('cv4pve-diag')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-arm.zip")

sha256sums_x86_64=('bdd6fd483ac024c92ed8fc7098cd98015ae2ff052160d7f91f63d6982bd61e7e')
sha256sums_aarch64=('5ce0f764907ea854ebe98b3f09b4bfc8259490ea686a9820c049d18d0638e86a')
sha256sums_armv7h=('647eb2c3615f5a34ee339711633024206694e5f5d0a5b563606bf0be64b3c64e')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

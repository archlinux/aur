# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-diag
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-diag
pkgver=2.8.0
pkgrel=1
pkgdesc="Diagnostic tool for Proxmox VE: checks nodes, VMs, LXC containers and storage for common issues"
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

sha256sums_x86_64=('5d3142b12d6e4b5b0b653bf6448e362203e69c823eb6342063df6180093796bf')
sha256sums_aarch64=('66b53ad4f4f801c1a135d6941add605e97ec21a3239fd2aca8c4994164781489')
sha256sums_armv7h=('e1f0da9243b61b33a3dfa7738d8ca79d1ced394ddc47dc3719299f4acc8e45ff')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

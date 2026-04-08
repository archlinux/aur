# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-diag
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-diag
pkgver=2.1.0
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

sha256sums_x86_64=('ff67d424f983d09f2ea1a9a5296cf0150ccdc5a3cef5ee07b8a22e3c401699ab')
sha256sums_aarch64=('a57cfd160a7070433017c58e5aa05816e0101c2a2b4bbb10717f9e23b445de7a')
sha256sums_armv7h=('1f44bcc56823f16ea0c6ee0f3115b3312a5f3b1016c5f1ab92d64040c67ace95')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

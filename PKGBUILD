# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-autosnap
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-autosnap
pkgver=2.2.0
pkgrel=1
pkgdesc="Automatic snapshot tool for Proxmox VE: schedule and manage VM/LXC snapshots with retention policies"
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

sha256sums_x86_64=('0d4603c146722dc443ce7bd782af5c330d4208563b964219ada7ff72982815fb')
sha256sums_aarch64=('1c6ac401b0e39429abda13a74cf8417ef2c72269f742812d83ddee5d72419e41')
sha256sums_armv7h=('d087d0af00fc358cb06e1f73269de97bfb182d586825b7fb83a0b7c14730f021')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

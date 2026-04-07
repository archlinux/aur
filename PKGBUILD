# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-report
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-report
pkgver=1.3.0
pkgrel=1
pkgdesc="Report tool for Proxmox VE — exports full infrastructure inventory to Excel (the RVTools for Proxmox VE)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-report"
license=('GPL-3.0-only')
depends=()
provides=('cv4pve-report')
conflicts=('cv4pve-report')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-report/releases/download/v${pkgver}/cv4pve-report-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-report/releases/download/v${pkgver}/cv4pve-report-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-report/releases/download/v${pkgver}/cv4pve-report-linux-arm.zip")

sha256sums_x86_64=('421f96067c85ea025504e5393a2a1e7df7634ba99bd3f23383be9b5609ea3955')
sha256sums_aarch64=('40696b80408972623d4147806c40d50640c7138a156bbc90c2c7d88e1b219c89')
sha256sums_armv7h=('2676590897b920f4344b63b13d5c18718aa2e49216938f07ad606328eb2ffd04')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

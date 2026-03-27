# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-report
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-report
pkgver=1.0.0
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

sha256sums_x86_64=('44c30cc1814f74e6fb7d8f09b3a0a06ece25c1fc8030169f64f3944e50065367')
sha256sums_aarch64=('f575cb6dd6151343deffce256d0d5bb855dc7fc047e6208dc26e3034d87c7766')
sha256sums_armv7h=('e7f1945999d4329679a3e4f443c10575c263de0b910cc29d763e80d97af25ff0')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

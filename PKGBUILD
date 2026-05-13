# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-report
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-report
pkgver=2.2.1
pkgrel=1
pkgdesc="Report tool for Proxmox VE — exports full infrastructure inventory to Excel"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-report"
license=('GPLv3')
depends=()
provides=('cv4pve-report')
conflicts=('cv4pve-report')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-report/releases/download/v${pkgver}/cv4pve-report-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-report/releases/download/v${pkgver}/cv4pve-report-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-report/releases/download/v${pkgver}/cv4pve-report-linux-arm.zip")

sha256sums_x86_64=('6eb976bd6c3448a91d1317259f642d1c1867e038a0ababaf762aeae57ffea284')
sha256sums_aarch64=('64e116e59495578ff78dd688bafb3065914023fa3e3962c64081fa3b2ab31dcf')
sha256sums_armv7h=('0b59cb8e793b9f5e7808b06c44e18e3e83b21050086bb6944bd52dd7b2373fe8')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

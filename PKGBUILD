# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-report
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-report
pkgver=2.7.0
pkgrel=1
pkgdesc="Report tool for Proxmox VE — exports full infrastructure inventory to Excel, HTML or JSON"
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

sha256sums_x86_64=('60b739b8dbd7b1911d6ce9e10d4f6d087f4d6111cf889eef85fb08b057916c24')
sha256sums_aarch64=('59b4087ddf1fd2ebf0af5e55a6428d9380e0b6de10cdd2a9d17c2525e53a16be')
sha256sums_armv7h=('075d853687bd87f7a3b3fbf1f24cb11a61eab82ccdc253e61c475883c65565f6')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

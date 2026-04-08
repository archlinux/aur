# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-report
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-report
pkgver=1.4.0
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

sha256sums_x86_64=('0ef2056e86b87171413370353c159e6318c572254abc8c349989765b0ebc60f2')
sha256sums_aarch64=('2ba51703d9c6cfea41eeae796138d0de985b02c78c75b91e028dd997a01ea019')
sha256sums_armv7h=('9074bef1d5030f24e273c329790a328a7ce08380d137b5ae63f9fbd8500e963e')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

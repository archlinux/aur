# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-metrics-exporter
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-metrics-exporter
pkgver=2.0.0
pkgrel=1
pkgdesc="Metrics exporter for Proxmox VE"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-metrics-exporter"
license=('GPLv3')
depends=()
provides=('cv4pve-metrics-exporter')
conflicts=('cv4pve-metrics-exporter')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-metrics-exporter/releases/download/v${pkgver}/cv4pve-metrics-exporter-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-metrics-exporter/releases/download/v${pkgver}/cv4pve-metrics-exporter-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-metrics-exporter/releases/download/v${pkgver}/cv4pve-metrics-exporter-linux-arm.zip")

sha256sums_x86_64=('3bb836c602228178bbccb71d0cb16b7f63ee974eb4a7c33da0249e46288f983d')
sha256sums_aarch64=('0206a0c591c38cc549a1562f92bbc074e4ee0c76f24eba049d40d4d4d2da7cbf')
sha256sums_armv7h=('dc80281114f3573d7c80f826a7f20a98652117eaa7a0e97038fa61aa71214361')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

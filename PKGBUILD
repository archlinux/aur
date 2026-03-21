# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Contributor: franklupo <franklupog@gmail.com>
# Project : https://github.com/Corsinvest/cv4pve-diag
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-diag
pkgver=2.0.1
pkgrel=1
pkgdesc="Diagnostic tool for Proxmox VE — checks nodes, VMs, LXC containers and storage for common issues"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-diag"
license=('MIT')
depends=()
provides=('cv4pve-diag')
conflicts=('cv4pve-diag')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-arm.zip")

sha256sums_x86_64=('776dd664dbacbab1044e624f36c6d1f5c60eb79848d548e16d9620e8dae24005')
sha256sums_aarch64=('b33d07c2f1d5dcf82b78fe623ad5ceb18176cde43116166e2fedda55281e36cc')
sha256sums_armv7h=('e1e7e9d51677c99730b95b836fe16fd42053cf74f41a60729e9ac74473b31398')

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

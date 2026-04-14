# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-pepper
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-pepper
pkgver=2.0.0
pkgrel=1
pkgdesc="SPICE/VNC console launcher for Proxmox VE — connect to VMs with a single command"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-pepper"
license=('MIT')
depends=()
provides=('cv4pve-pepper')
conflicts=('cv4pve-pepper')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-arm.zip")

sha256sums_x86_64=('65e029a38863dc3eaa8816ca91098da2244e559a55f2ad672b96a059b52f0262')
sha256sums_aarch64=('bbb45a6b2b1c8b14afc455370771392f7169a15b8ed9c70cacdbd35507c8bf46')
sha256sums_armv7h=('4b68c6a676cb779a7afb0d9e0177281b93e795bdc61ce1b5111d71bf774af416')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

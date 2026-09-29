# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-pepper
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-pepper
pkgver=2.0.1
pkgrel=1
pkgdesc="SPICE/VNC console launcher for Proxmox VE — connect to VMs with a single command"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-pepper"
license=('GPLv3')
depends=()
provides=('cv4pve-pepper')
conflicts=('cv4pve-pepper')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-arm.zip")

sha256sums_x86_64=('fe90bbcf09c8443a1486ed694061d7edeb437069cc38b8476064ac387a1b15ac')
sha256sums_aarch64=('946e28f1ed940214758892434644f4036a767a5f8e0cf3d89e016cab8b587c7b')
sha256sums_armv7h=('b55017cfaab9e620868926c3d04cc62d2451011a3be59922c7d980c19f731138')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

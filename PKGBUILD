# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-diag
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-diag
pkgver=2.3.0
pkgrel=1
pkgdesc="Diagnostic tool for Proxmox VE — checks nodes, VMs, LXC containers and storage for common issues"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-diag"
license=('GPLv3')
depends=()
provides=('cv4pve-diag')
conflicts=('cv4pve-diag')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-diag/releases/download/v${pkgver}/cv4pve-diag-linux-arm.zip")

sha256sums_x86_64=('7666cac98e75e20ce78ff1a173a5b63976d2e488bef1c03b4a0f49d92d8f3419')
sha256sums_aarch64=('d942be0e93e3ad8b3f8a198f4b165307668a25d0fce622b56261108fe348a033')
sha256sums_armv7h=('d99739cce39c5bec1c74b2d4db86eb4959f4c3c398ec18247368c6ae86882e8a')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

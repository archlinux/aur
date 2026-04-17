# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-node-protect
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-node-protect
pkgver=2.1.0
pkgrel=1
pkgdesc="Backup Proxmox VE node configuration files via SSH"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-node-protect"
license=('GPLv3')
depends=()
provides=('cv4pve-node-protect')
conflicts=('cv4pve-node-protect')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-node-protect/releases/download/v${pkgver}/cv4pve-node-protect-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-node-protect/releases/download/v${pkgver}/cv4pve-node-protect-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-node-protect/releases/download/v${pkgver}/cv4pve-node-protect-linux-arm.zip")

sha256sums_x86_64=('cfd15bd1796ea8a4682664bde88b2bfc7bbbf482466a8316df4bc70e85b13518')
sha256sums_aarch64=('ec1b5e12b898d81159243cff764e33fc00ac3173f76281eb405c0b3d6b621d62')
sha256sums_armv7h=('02cba680b5442ef989cac2d17ef1dee1c7f8f7140d34d7519ffe62b869ffbabd')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

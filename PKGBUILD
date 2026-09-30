# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-cli
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-cli
pkgver=2.4.0
pkgrel=1
pkgdesc="Command-line interface for Proxmox VE: manage API calls, contexts and aliases"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-cli"
license=('MIT')
depends=()
provides=('cv4pve-cli')
conflicts=('cv4pve-cli')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-cli/releases/download/v${pkgver}/cv4pve-cli-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-cli/releases/download/v${pkgver}/cv4pve-cli-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-cli/releases/download/v${pkgver}/cv4pve-cli-linux-arm.zip")

sha256sums_x86_64=('28135b80aecc5632152bc29f8ef67ebc1ab05249126262c43ee82e7b319bf9b9')
sha256sums_aarch64=('4a479bfcfcd0e1340bd5adba0053c95b21e19a6537c01bb75bddd769d3997b78')
sha256sums_armv7h=('b8d63dc23247686d2368f78b874d0f82228a6c30b03c64f79b232810e4c8dbda')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

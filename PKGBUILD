# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-cli
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-cli
pkgver=2.3.0
pkgrel=1
pkgdesc="Command-line interface for Proxmox VE — manage API calls, contexts and aliases"
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

sha256sums_x86_64=('6394dbd6b9107dd6ba6e928cfa96bc8a4b4db4a75211f3a1f0d9ba21e079d7de')
sha256sums_aarch64=('404a95a7252f1cb47109b8acb177925b092a63ee0500f43c2caec290d24bdcf8')
sha256sums_armv7h=('8ba84434fb1bb7e029753e1171d84d4ddab530935b7a7fcf20e482bc83eb0e57')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

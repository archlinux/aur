# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-cli
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-cli
pkgver=2.2.1
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

sha256sums_x86_64=('4b403d1c645d9a758d99c8fc9ba3fac36611fb8c98d374c47e2ef3d904e4b05c')
sha256sums_aarch64=('00400ffadb06f822c475517db045cee8f5312dd386741956947b454e17d25847')
sha256sums_armv7h=('658af1ad9bd3db3af86cecf203319766a20f7472347e586b56303441bbf42115')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

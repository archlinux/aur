# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-cli
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-cli
pkgver=2.2.0
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

sha256sums_x86_64=('21bdedad878132eb24cd9ccb8519f2ec0bb6828c7db85057713b9022cd560b67')
sha256sums_aarch64=('97e2188e88e094a8293b97a036a6e783bfd8b0070cfaf6602ae89b456582f88e')
sha256sums_armv7h=('6b45e246c1037a7d5851973bcc54dc1c4422a712e3b29bc07270a94e165ac69d')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-botgram
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-botgram
pkgver=2.0.0
pkgrel=1
pkgdesc="Telegram bot for Proxmox VE: manage and monitor your cluster via Telegram"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-botgram"
license=('GPLv3')
depends=()
provides=('cv4pve-botgram')
conflicts=('cv4pve-botgram')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-botgram/releases/download/v${pkgver}/cv4pve-botgram-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-botgram/releases/download/v${pkgver}/cv4pve-botgram-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-botgram/releases/download/v${pkgver}/cv4pve-botgram-linux-arm.zip")

sha256sums_x86_64=('6881f94c76c4ab62460ca9e006217c687c544e19411213e64bc3c3c0264df622')
sha256sums_aarch64=('43932038847a4b3ccd76ceb481bd00c1f598826c0dc54c1aa148d2cce06163f2')
sha256sums_armv7h=('e6f48dc977e72c183d96d885d864c3eef567f4aa5a8d8ddc40255173b60d71b6')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

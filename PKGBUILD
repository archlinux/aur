# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Contributor: franklupo <franklupog@gmail.com>
# Project : https://github.com/Corsinvest/cv4pve-cli
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-cli
pkgver=2.1.0
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

sha256sums_x86_64=('1ff059f5010d9c8323df0a2972bb70386e91c88d615d381e34545424a7319596')
sha256sums_aarch64=('4b2bedb3cc516dfb28f5fb74411f3cc190cd12f32e89aee7d1ceaf45db2cf255')
sha256sums_armv7h=('48cc166a3d1d86a0ec7cf668cd733bad796e584a7a21dfd14618d5c94c1fa63b')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Contributor: franklupo <franklupog@gmail.com>
# Project : https://github.com/Corsinvest/cv4pve-autosnap
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-autosnap
pkgver=2.0.0
pkgrel=1
pkgdesc="Automatic snapshot tool for Proxmox VE — schedule and manage VM/LXC snapshots"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-autosnap"
license=('MIT')
depends=()
provides=('cv4pve-autosnap')
conflicts=('cv4pve-autosnap')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-arm.zip")

sha256sums_x86_64=('a3c12642254105b4401e21e276031203c1aeccd34f9f9e91cedb99191d0edcb4')
sha256sums_aarch64=('be566adf0b17f4e1d563ca07b83c3140fd3d2c40c44b6acb9f4b8facf747ac6a')
sha256sums_armv7h=('532c46da1785b213bf2047ef72c0510b4b4de1e3280728899a083d4ba635d435')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

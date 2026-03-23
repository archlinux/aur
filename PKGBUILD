# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Contributor: franklupo <franklupog@gmail.com>
# Project : https://github.com/Corsinvest/cv4pve-pepper
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-pepper
pkgver=1.9.0
pkgrel=1
pkgdesc="SPICE console launcher for Proxmox VE — connect to VMs with a single command"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-pepper"
license=('MIT')
depends=()
provides=('cv4pve-pepper')
conflicts=('cv4pve-pepper')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-pepper/releases/download/v${pkgver}/cv4pve-pepper-linux-arm.zip")

sha256sums_x86_64=('9b101e4e031c245c1451c0427330c454ec5d74596b4b827b08a79f424f92816c')
sha256sums_aarch64=('3cb9574da163a46a2e2dfdb3350e3e8cb616159e2621b81a291a4c701ce369fa')
sha256sums_armv7h=('cf00ca497406ad413fac3f4f4d2417a5831f93c0f71a2021b27a5024b38275a8')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

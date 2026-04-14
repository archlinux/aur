# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-autosnap
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-autosnap
pkgver=2.1.0
pkgrel=1
pkgdesc="Automatic snapshot tool for Proxmox VE — schedule and manage VM/LXC snapshots with retention policies"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Corsinvest/cv4pve-autosnap"
license=('GPLv3')
depends=()
provides=('cv4pve-autosnap')
conflicts=('cv4pve-autosnap')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-arm64.zip")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zip::https://github.com/Corsinvest/cv4pve-autosnap/releases/download/v${pkgver}/cv4pve-autosnap-linux-arm.zip")

sha256sums_x86_64=('a09d55c1ce20e0e71090553b364d48f1b4a6344d0db4d757000270f015e1e6eb')
sha256sums_aarch64=('2b274b0aece7c9362d6354bd84206e16e2e22c815c0481cfd647c96fead36cd7')
sha256sums_armv7h=('c1104cf7216c54b4e4e43ff2987dc2f3712956bf2d27e8e93e02e084a82ce241')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

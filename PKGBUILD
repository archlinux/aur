# Maintainer: Corsinvest Srl <corsinvest@corsinvest.it>
# Project : https://github.com/Corsinvest/cv4pve-autosnap
# Part of : CV4PVE Suite - https://www.corsinvest.it/cv4pve

pkgname=cv4pve-autosnap
pkgver=2.2.1
pkgrel=1
pkgdesc="Automatic snapshot tool for Proxmox VE: schedule and manage VM/LXC snapshots with retention policies"
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

sha256sums_x86_64=('09c4661e39c89c2a91d5edc48395b9c7ce0371b79fb7e327fa280d212e386b37')
sha256sums_aarch64=('0e215eec6f176f42d053a1650732e613870dc816f667b57b722e2b35477fd7e5')
sha256sums_armv7h=('181a013162e99e9deb970ea1efb42db3490a7c766f9db756deecaa61dd93d71b')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

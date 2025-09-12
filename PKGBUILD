# Maintainer: KevinCrrl

pkgname=kpa-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR helper"
arch=('x86_64' 'aarch64')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3')
options=('!debug')
depends=('pacman' 'git' 'base-devel' 'zlib' 'glibc')
optdepends=('torsocks' 'tor' 'sudo' 'doas')
source_x86_64=("https://github.com/KevinCrrl/kpa/releases/download/${pkgver}/kpa-x86_64-${pkgver}")
sha256sums_x86_64=('54932d75b3951a778981dba8e6e79a46df82df4e3e62c171e5e5c98983c05ccf')

source_aarch64=("https://github.com/KevinCrrl/kpa/releases/download/${pkgver}/kpa-aarch64-${pkgver}")
sha256sums_aarch64=('366f16287b77a9fd21d6dc2f06b3c7d4b8c3ec83728826790043add9319a3c03')

package() {
    local binaryname="kpa-${CARCH}-${pkgver}"
    install -Dm755 "$srcdir/$binaryname" "$pkgdir/usr/bin/kpa"
}

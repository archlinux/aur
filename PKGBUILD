# Maintainer: KevinCrrl

pkgname=kpa-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR helper"
arch=('x86_64' 'aarch64')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3')
options=('!debug')
depends=('pacman' 'git' 'base-devel' 'zlib' 'glibc')
optdepends=('torsocks' 'tor' 'sudo' 'doas')
source_x86_64=("https://github.com/KevinCrrl/kpa/releases/download/${pkgver}/kpa-x86_64-${pkgver}")
sha256sums_x86_64=('0b73fe9454257e20611a02dd9126bb7a4eb6e072aab25c06217e01d52feaadda')

source_aarch64=("https://github.com/KevinCrrl/kpa/releases/download/${pkgver}/kpa-aarch64-${pkgver}")
sha256sums_aarch64=('48cf413d384ee5b52bdbfeb0a147ff1f15259c90b1882be404b6895d532e5c04')

package() {
    local binaryname="kpa-${CARCH}-${pkgver}"
    install -Dm755 "$srcdir/$binaryname" "$pkgdir/usr/bin/kpa"
}

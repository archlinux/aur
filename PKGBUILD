# Maintainer: KevinCrrl

pkgname=kpa-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="KevinCrrl Python AUR helper"
arch=('x86_64' 'aarch64')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3')
options=('!debug')
depends=('pacman' 'git' 'fakeroot' 'zlib' 'glibc')
optdepends=('torsocks' 'tor' 'sudo' 'doas')
source_x86_64=("https://github.com/KevinCrrl/kpa/releases/download/${pkgver}/kpa-x86_64-${pkgver}")
sha256sums_x86_64=('ffbfbf7d43501883d64fe367b8755ffe248cba334c09903c010abde0c6b4417a')

source_aarch64=("https://github.com/KevinCrrl/kpa/releases/download/${pkgver}/kpa-aarch64-${pkgver}")
sha256sums_aarch64=('5311a068df8efd68baa1a22987cfb1f701db52319ca7a3dd8c5deda5ecbf6ab0')

package() {
    local binaryname="kpa-${CARCH}-${pkgver}"
    echo "kpa-bin en AUR no será mantenido más, cuando salga KPA 1.7.0 será reemplazado por el paquete kpa en AUR."
    install -Dm755 "$srcdir/$binaryname" "$pkgdir/usr/bin/kpa"
}

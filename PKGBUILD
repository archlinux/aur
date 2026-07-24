# Maintainer: czyt <czytcn@gmail.com>
pkgname=mimo-code-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Next-generation AI coding assistant for developers with unlimited context"
arch=('x86_64' 'aarch64')
url="https://mimo.xiaomi.com/mimocode"
license=('MIT')
depends=('glibc')
options=('!strip' '!debug')
provides=('mimo-code')
conflicts=('mimo-code')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v${pkgver}/mimocode-linux-x64.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v${pkgver}/mimocode-linux-arm64.tar.gz")
sha256sums_x86_64=('99ade0a26235d80db7bb6ac0319b0f6508dfe684e2cfab7a00801ad6aa2ac673')
sha256sums_aarch64=('801bb33a18c66bfffaf342735780bb2635f419044003550d0e167eaf776e0db0')

package() {
    install -Dm755 "${srcdir}/mimo" "${pkgdir}/usr/bin/mimo"
}

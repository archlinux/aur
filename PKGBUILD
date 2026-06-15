# Maintainer: czyt <czytcn@gmail.com>
pkgname=mimo-code-bin
pkgver=0.1.1
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
sha256sums_x86_64=('53a777c4d828d564a139a50569ebef071cd286b179a13a5fcdc23857ce256f7a')
sha256sums_aarch64=('54c1fc07e112486c895eee2c8685f3b1e1d736db75ed0ee6634372882a4ed2d9')

package() {
    install -Dm755 "${srcdir}/mimo" "${pkgdir}/usr/bin/mimo"
}

# Maintainer: czyt <czytcn@gmail.com>
pkgname=mimo-code-bin
pkgver=0.1.0
pkgrel=4
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
sha256sums_x86_64=('e0ee0d032b9dd1350193fe6f3eb0ba288fd0a641e29dc651cd7e3df5ac6f29ad')
sha256sums_aarch64=('12a3c50ff5789ad5dcf54fd216353012467a66b3d27b015968a6e4ea88347ab1')

package() {
    install -Dm755 "${srcdir}/mimo" "${pkgdir}/usr/bin/mimo"
}

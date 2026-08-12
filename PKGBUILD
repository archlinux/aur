# Maintainer: czyt <czytcn@gmail.com>
pkgname=mimo-code-bin
pkgver=0.1.11
pkgrel=2
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
sha256sums_x86_64=('1c853f83b5b5dbc7efde58a11c6aab84db9b2c5bf82700719aa1b7189cdae4c4')
sha256sums_aarch64=('0115fa86c00ec946c1bef2ebcd591fd69b1e539b0dd66d6a3e76a68638bddd00')

package() {
    install -Dm755 "${srcdir}/mimo" "${pkgdir}/usr/bin/mimo"
}

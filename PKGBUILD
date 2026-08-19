# Maintainer: czyt <czytcn@gmail.com>
pkgname=mimo-code-bin
pkgver=0.1.13
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
sha256sums_x86_64=('0997a43647a99969d0194fad71af1fd6112aa8220e24a4562aea63953b1e1ada')
sha256sums_aarch64=('7000a32f12aaa0936f6b0536fad5cd4fe465820eee99c7f86fb4b6278ef735a2')

package() {
    install -Dm755 "${srcdir}/mimo" "${pkgdir}/usr/bin/mimo"
}

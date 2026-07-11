# Maintainer: czyt <czytcn@gmail.com>
pkgname=lucarned-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Stop babysitting local AI agents. Just notifications, approve, and resume your Codex, Pi, or Claude code sessions anywhere."
arch=('x86_64' 'aarch64')
url="https://github.com/tuchg/Lucarne"
license=('MIT')
provides=('lucarned')
conflicts=('lucarned')
install=lucarned-bin.install
source_x86_64=("lucarned-x86_64-${pkgver}.tar.xz::https://github.com/tuchg/Lucarne/releases/download/v${pkgver}/lucarned-v${pkgver}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("lucarned-aarch64-${pkgver}.tar.xz::https://github.com/tuchg/Lucarne/releases/download/v${pkgver}/lucarned-v${pkgver}-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('418ed1d35babe57376c6acab07d5eb7bb8f3f8183612d00463689b5e98923652')
sha256sums_aarch64=('93b6c54ae2345b16169409c03a81082f9503fe776ed8706c6c26980480ad06f1')

package() {
    install -Dm755 "${srcdir}/lucarned-${CARCH}-unknown-linux-gnu/lucarned" "${pkgdir}/usr/bin/lucarned"
}

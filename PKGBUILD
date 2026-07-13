# Maintainer: czyt <czytcn@gmail.com>
pkgname=lucarned-bin
pkgver=0.5.1
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
sha256sums_x86_64=('209c0212ca5ec9b8bd7a89f25ce942f5f1c7fe43a690a2c297c6b5ed0eb65905')
sha256sums_aarch64=('08aee7675fa61f413c982dbc8853fa754897812f8735d97335c9aa6f5449ac17')

package() {
    install -Dm755 "${srcdir}/lucarned-${CARCH}-unknown-linux-gnu/lucarned" "${pkgdir}/usr/bin/lucarned"
}

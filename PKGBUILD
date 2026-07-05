# Maintainer: czyt <czytcn@gmail.com>
pkgname=lucarned-bin
pkgver=0.4.3
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
sha256sums_x86_64=('a5e8a86717fb0076969976f68ac8b8a9526e2784c1f21520f0406d8aea766506')
sha256sums_aarch64=('e724166261de8d0d05c942b80b5f6273095386adee5e7e1ac7f4117ec8da9c79')

package() {
    install -Dm755 "${srcdir}/lucarned-${CARCH}-unknown-linux-gnu/lucarned" "${pkgdir}/usr/bin/lucarned"
}

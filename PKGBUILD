# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A scrolling screenshot tool for Wayland"
arch=('x86_64')
url="https://github.com/jswysnemc/wayscrollshot"
license=('MIT')
depends=('gcc-libs' 'glibc' 'grim' 'libxkbcommon' 'opencv' 'slurp')
optdepends=(
    'wl-clipboard: copy screenshots to the Wayland clipboard'
    'xclip: X11 clipboard fallback'
)
provides=("wayscrollshot=${pkgver}")
conflicts=('wayscrollshot' 'wayscrollshot-git')
source=("${url}/releases/download/v${pkgver}/wayscrollshot-archlinux-x86_64.tar.gz")
sha256sums=('fe3422610def2c4ab98bc7860cf86b9293b906eb7e3d950beb3d65c03721be09')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

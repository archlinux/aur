# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.5
pkgrel=2
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
source=("wayscrollshot-bin-0.1.5.tar.gz::${url}/releases/download/v${pkgver}/wayscrollshot-archlinux-x86_64.tar.gz")
sha256sums=('d95e8df34bb7837d8641fd852a2481c4cf01c5044ecdfb1f6791864cecfaec85')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.6
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
source=("wayscrollshot-bin-0.1.6.tar.gz::${url}/releases/download/v${pkgver}/wayscrollshot-archlinux-x86_64.tar.gz")
sha256sums=('ccaefea85f8f52831f9a08fec703e982bba12fe700c59576ef97e41eb6fb536b')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

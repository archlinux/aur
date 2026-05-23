# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.8
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
source=("wayscrollshot-bin-0.1.8.tar.gz::${url}/releases/download/v${pkgver}/wayscrollshot-archlinux-x86_64.tar.gz")
sha256sums=('8f87d8349f1174191bbe5a6820702dcfea8309b7b8b3928b4825c9d5564a12c9')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

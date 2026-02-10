# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A screenshot tool for Wayland compositors that support the wlr-screencopy-unstable-v1 protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/jswysnemc/wayscrollshot"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('wayscrollshot')
conflicts=('wayscrollshot' 'wayscrollshot-git')
source_x86_64=("${url}/releases/download/v${pkgver}/wayscrollshot-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/wayscrollshot-linux-aarch64.tar.gz")
sha256sums_x86_64=('3d0ddadc4020468bae8ce4c36364ace596c2d410571143a1aeddab1947aa7ab0')
sha256sums_aarch64=('b6677c8310864a0182c2435f41fdf4b196c2d410571143a1aeddab1947aa7ab0')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

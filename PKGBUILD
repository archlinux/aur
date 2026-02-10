# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.2
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
sha256sums_x86_64=('95b857d92f58fef51e7a81b9213ff6b4eb7745724adce4932cdca0e3b7a2df96')
sha256sums_aarch64=('4beb971749ba4f79eab64f54da0b21a29a0130a1ba1035b676c6529b6c112ddc')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

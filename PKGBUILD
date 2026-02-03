# Maintainer: Snemc-s <snemc@snemc.cn>
pkgname=wayscrollshot-bin
pkgver=0.1.0
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
sha256sums_x86_64=('ddc13a8043be130144850fbe9979ac14274d61489882daa5877ff8b8da939b95')
sha256sums_aarch64=('3b8c2f813d505639e301075b72d3d3ab1d06e43539e5c1a504b28c2400921c6b')

package() {
    install -Dm755 wayscrollshot "${pkgdir}/usr/bin/wayscrollshot"
}

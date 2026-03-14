# Maintainer: AntoineGS <antoineg.simard at gmail dot com>
pkgname=tidydots-bin
pkgver=0.3
pkgrel=1
pkgdesc="Cross-platform dotfile management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/AntoineGS/tidydots"
license=('MIT')
provides=('tidydots')
conflicts=('tidydots')
source_x86_64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('566118a71422a0339c7fdfa447d8d5b1641d2eae426e1078960d95e36f9ccf95')
sha256sums_aarch64=('4002694bc3b632019ee97b3cf8fdec6642af53bc2c9b19cc357bd64cde6efde1')

package() {
    install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"
}

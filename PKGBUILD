# Maintainer: AntoineGS <antoineg.simard at gmail dot com>
pkgname=tidydots-bin
pkgver=1.0
pkgrel=1
pkgdesc="Cross-platform dotfile management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/AntoineGS/tidydots"
license=('MIT')
provides=('tidydots')
conflicts=('tidydots')
source_x86_64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e2e9c9756a956e588f601cfefbd617d693efa6f5fc91f98243ec09b98c8eaa36')
sha256sums_aarch64=('1ec657d7429e60171bbb70e7fe3a8569ac0416a187dd1939cfa0769734a0815c')

package() {
    install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"
}

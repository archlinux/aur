# Maintainer: AntoineGS <antoineg.simard at gmail dot com>
pkgname=tidydots-bin
pkgver=0.4
pkgrel=1
pkgdesc="Cross-platform dotfile management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/AntoineGS/tidydots"
license=('MIT')
provides=('tidydots')
conflicts=('tidydots')
source_x86_64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0d1273accf770aa04f615d3bb61e23c3d850047a122ad48c4d448d418d62162b')
sha256sums_aarch64=('ed483379072a3ff1250cd6651aaac269d7936138d59e17c570c2021a37dcd1dd')

package() {
    install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"
}

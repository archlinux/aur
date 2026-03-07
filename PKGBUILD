# Maintainer: AntoineGS <antoineg.simard at gmail dot com>
pkgname=tidydots-bin
pkgver=0.2
pkgrel=1
pkgdesc="Cross-platform dotfile management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/AntoineGS/tidydots"
license=('MIT')
provides=('tidydots')
conflicts=('tidydots')
source_x86_64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a32d6c84eb1d5ac36f86dc385957bc10492553c774731151a9acd8a3423f2063')
sha256sums_aarch64=('647a4d5b61a7c21cede5c8a06320a12ad878be840344b3d85ba39f7cc8d21352')

package() {
    install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"
}

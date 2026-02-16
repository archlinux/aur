# Maintainer: AntoineGS <antoineg.simard at gmail dot com>
pkgname=tidydots-bin
pkgver=0.1
pkgrel=1
pkgdesc="Cross-platform dotfile management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/AntoineGS/tidydots"
license=('MIT')
provides=('tidydots')
conflicts=('tidydots')
source_x86_64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/AntoineGS/tidydots/releases/download/v${pkgver}/tidydots_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6a18af45e327ebe95a86bf6d16db13f04f0e0855131ab027e70c4c4a9ab9d48c')
sha256sums_aarch64=('b83c182a77a8a8c76f65e135fecde1acfca6aebe92c80efd8720b94f28e4e3a6')

package() {
    install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"
}

# Maintainer: QwerProg
pkgname=bili-tools-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A multi-functional CLI tool for Bilibili (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/qwerprog/bili-tools"
license=('MIT')
depends=('gcc-libs')
provides=('bili-tools')
conflicts=('bili-tools' 'bili-tools-git')
options=('!debug')
source_x86_64=("bit-v${pkgver}-linux-amd64.tar.gz::https://github.com/qwerprog/bili-tools/releases/download/v${pkgver}/bit-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("bit-v${pkgver}-linux-arm64.tar.gz::https://github.com/qwerprog/bili-tools/releases/download/v${pkgver}/bit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('3f65c201eb0e063d924dc8c710d0ee913ff315d5de3ce24849bf5c91f227bad1')
sha256sums_aarch64=('d7670eaf84bc7e5498a74b1548cdbbc67a1030575f839031c94efec63b68990a')
package() {
  install -Dm755 "${srcdir}/bit" "${pkgdir}/usr/bin/bit"
}

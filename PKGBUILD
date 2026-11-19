# Maintainer: QwerProg
pkgname=bili-tools-bin
pkgver=1.0.1
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
sha256sums_x86_64=('c0d3395306a803b359593356a3b260484f72dbe25ed0ef0698289bfeae350cf4')
sha256sums_aarch64=('5e0ca0ce1636ac230d26ee8203b3754013b4392dbe516b6b71164d8cc10af694')
package() {
  install -Dm755 "${srcdir}/bit" "${pkgdir}/usr/bin/bit"
}

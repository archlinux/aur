# Maintainer: QwerProg
pkgname=bili-tools-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="B站直播开播工具 — 命令行一键开播/下播 (预编译二进制版)"
arch=('x86_64' 'aarch64')
url="https://github.com/QwerProg/bili-tools"
license=('MIT')
depends=('gcc-libs')
provides=('bili-tools')
conflicts=('bili-tools' 'bili-tools-git')

source_x86_64=("https://github.com/QwerProg/bili-tools/releases/download/v${pkgver}/bt-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/QwerProg/bili-tools/releases/download/v${pkgver}/bt-arm64-linux.tar.gz")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "${srcdir}/bt" "${pkgdir}/usr/bin/bt"
}

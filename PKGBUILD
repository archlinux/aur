# Maintainer: QwerProg
pkgname=bili-tools-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="B站直播开播工具 — 命令行一键开播/下播 (预编译二进制版)"
arch=('x86_64' 'aarch64')
url="https://github.com/QwerProg/bili-tools"
license=('MIT')
depends=('gcc-libs')
provides=('bili-tools')
conflicts=('bili-tools' 'bili-tools-git')
options=('!debug')
source_x86_64=("bt-${pkgver}-x86_64-linux.tar.gz::https://github.com/QwerProg/bili-tools/releases/download/v${pkgver}/bt-x86_64-linux.tar.gz")
source_aarch64=("bt-${pkgver}-arm64-linux.tar.gz::https://github.com/QwerProg/bili-tools/releases/download/v${pkgver}/bt-arm64-linux.tar.gz")
sha256sums_x86_64=('70fa6fe02577b583b2397268ed3c0a95db54ecc660d6c41403f1b2571d981682')
sha256sums_aarch64=('7db1fb276168256fc3e5dacac7666207be505a530c9011267224bddc14abdf50')
package() {
  install -Dm755 "${srcdir}/bt" "${pkgdir}/usr/bin/bt"
}

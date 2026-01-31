# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A pure functional language for system configuration and package management (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs')
provides=('neve')
conflicts=('neve' 'neve-git')

source_x86_64=("neve-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("neve-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('97ae473288b824be7b4157d9c1eddc867b6467ff25fd2ed41e430451a6253076')
sha256sums_aarch64=('30ff7c258eb6b207b3c02778b7957795aa0980b66594458ad75e09daf7d55f9d')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

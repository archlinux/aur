# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=3.18.0
pkgrel=1
pkgdesc="Standalone language for system configuration, builds, and shell automation (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs')
provides=("neve=${pkgver}")
conflicts=('neve' 'neve-git')

source_x86_64=("neve-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("neve-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d6846d63a4a08e18902d5578b8bc3f52839923fa5e57f4d00cca7a9786f491e1')
sha256sums_aarch64=('5ca0bbf2a46c40368b87520b9ce20db2ab94150997ac30dc339f57642bca9ae6')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

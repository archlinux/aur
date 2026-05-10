# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="Standalone language for system configuration, builds, and shell automation (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs')
provides=("neve=${pkgver}")
conflicts=('neve' 'neve-git')

source_x86_64=("neve-3.8.0-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v3.8.0/neve-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("neve-3.8.0-aarch64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v3.8.0/neve-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("676cf5e91b09ff952d4b0ffb35ae1f0ffa1b4e7c357744f367ba42228ee9aa12")
sha256sums_aarch64=('dbe0c7fe11c1243d64db1ff31c98bb553a05735a631c14940a3f1c9228afce59')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

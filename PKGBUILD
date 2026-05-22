# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=3.14.0
pkgrel=1
pkgdesc="Standalone language for system configuration, builds, and shell automation (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs')
provides=("neve=${pkgver}")
conflicts=('neve' 'neve-git')

source_x86_64=("neve-3.14.0-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v3.14.0/neve-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("neve-3.14.0-aarch64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v3.14.0/neve-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5")
sha256sums_aarch64=('dbe0c7fe11c1243d64db1ff31c98bb553a05735a631c14940a3f1c9228afce59')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=3.3.2
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
sha256sums_x86_64=('5c3db2216951e2ca6d2d6197ed7e468d4ca983a2537bf7b5805e2ce0aedb7e8a')
sha256sums_aarch64=('dbe0c7fe11c1243d64db1ff31c98bb553a05735a631c14940a3f1c9228afce59')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

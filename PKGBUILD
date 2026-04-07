# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=1.1.1
pkgrel=2
pkgdesc="Standalone language for system configuration, builds, and shell automation (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs')
provides=("neve=${pkgver}")
conflicts=('neve' 'neve-git')

source_x86_64=("neve-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("neve-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ad7f242887684d3a2d197b3b7d9253f30d132e85799ba41f50c1e8033150615d')
sha256sums_aarch64=('053a8aa644ff4dd46770b242490d64d758ff90ccdfba29592123e50ee114dc3c')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

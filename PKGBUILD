# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A pure functional language for system configuration and package management (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs')
provides=('neve')
conflicts=('neve' 'neve-git')

source_x86_64=("https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/MCB-SMART-BOY/Neve/releases/download/v${pkgver}/neve-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3c43221328bf16afdfcf18e4c0930ebb827adf287ecb614386b1314e7ead6f59')
sha256sums_aarch64=('9781b834309e857aee7acbb59c42743c789e8e0c71caf81667971a231cb76066')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

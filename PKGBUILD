# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=0.6.1
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
sha256sums_x86_64=('c9eba61280b1351f152cebf5b26783f6f8b238a2fdaa209f254163929ec84693')
sha256sums_aarch64=('7bde332766e97198be60eafeb502fc81bf986e4eb5b98af9f84de1ac8ea2f71c')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

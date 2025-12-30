# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=0.6.4
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
sha256sums_x86_64=('6784dea68212bdd1a93063d1ccc19dfb488cef0daa4a5251289d17e25f4318cb')
sha256sums_aarch64=('f60ee39554dd9b682c94f7f85a7605727b15a64cb843e5acb6f93802322c76f1')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

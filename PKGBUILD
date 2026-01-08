# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=0.7.0
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
sha256sums_x86_64=('324b0b098d7a2f60c44d2e7bef7d88da8f8067519c04af3bd78561fe3fadb294')
sha256sums_aarch64=('e3f2493682df57a7eb916cc15fca2aff8db23d653756796f13160b692fd9dfa6')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

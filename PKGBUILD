# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=0.6.0
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
sha256sums_x86_64=('7e56abc25b60cf9ee9e9d4419e6b43721660f23af7627a6bd37cac90a33b17d2')
sha256sums_aarch64=('0b8b26f99c20be5c03f54eb83c43e0bb00822b0dfedfbf9f99bd63f7088b433b')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

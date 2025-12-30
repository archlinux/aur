# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-bin
pkgver=0.6.2
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
sha256sums_x86_64=('ab1d70dc486115a2ed2d2c75a2ee8f4085ee94a55f6db6f85e6c4de6086a1c2c')
sha256sums_aarch64=('6acdee32d88dda1579f9d7a132483f29763191c5e35cd8bb749d97fa7ffc543d')

package() {
    install -Dm755 "neve" "$pkgdir/usr/bin/neve"
}

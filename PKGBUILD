# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc-bin
pkgver=33
pkgrel=1
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorMC/releases/download/a33.2024.11.16-1/colormc-linux-a33-1-x86_64.pkg.tar.zst')
sha256sums=('7433e872015b25df588e2f1a6f66694b961492f6375a6e6721f1f5264d780cd1')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a33-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

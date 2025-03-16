# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc
pkgver=35
pkgrel=1
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorMC/releases/download/a35.2025.3.16/colormc-linux-a35-1-x86_64.pkg.tar.zst')
sha256sums=('cf1173a265f6ee37e61ddab53793641d874b6c81261797e7d25be9205cfea452')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a35-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

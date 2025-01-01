# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc-bin
pkgver=34
pkgrel=1
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorMC/releases/download/a34.2025.1.1/colormc-linux-a34-1-x86_64.pkg.tar.zst')
sha256sums=('83de1f365432616a4c8e42b4403e79c2458849176d7dc612c471b2cda51f1994')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a34-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

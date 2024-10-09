# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc
pkgver=30
pkgrel=1
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorMC/releases/download/a30.2024.9.12/colormc-linux-a30-1-x86_64.pkg.tar.zst')
sha256sums=('b2522d36190e0eaa09a07c01ca005a48ac7f345a78f529f387c44f78ef5a3c35')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a30-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

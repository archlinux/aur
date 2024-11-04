# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc
pkgver=32
pkgrel=1
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorMC/releases/download/a32.2024.11.4-2/colormc-linux-a32-1-x86_64.pkg.tar.zst')
sha256sums=('198feeebb9b07c54f5b9c6806a9c068a8e5fd804b178652f51d8df1e00a4b558')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a32-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc-bin
pkgver=31
pkgrel=3
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorMC/releases/download/a31.2024.10.16/colormc-linux-a31-1-x86_64.pkg.tar.zst')
sha256sums=('973604c4474912c092854a40bdef3c7c5a77f8b33a10b84f6b00cc844126da7a')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a31-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

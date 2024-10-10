# Maintainer: coloryr <402067010@qq.com>

pkgname=colormc
pkgver=31
pkgrel=1
pkgdesc="A Minecraft Launcher"
url="https://www.github.com/Coloryr/ColorMC"
arch=('x86_64')
packager="colormc"
license=('Apache 2.0')
conflicts=('colormc' 'minecraft' 'launcher')
source=('https://github.com/Coloryr/ColorMC/releases/download/a31.2024.10.10/colormc-linux-a31-1-x86_64.pkg.tar.zst')
sha256sums=('0db7a07a087bf54848044217d985aaddd6d243b80e4fe7dc5dde973ae0c2ec25')
OPTIONS=(!strip)
install=colormc.install

package() {
    tar -I zstd -xf colormc-linux-a30-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

# Maintainer: coloryr <402067010@qq.com>

pkgname=colordesktop-bin
pkgver=1
pkgrel=1
pkgdesc="A Desktop Tools"
url="https://www.github.com/Coloryr/ColorDesktop"
arch=('x86_64')
packager="colordesktop"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorDesktop/releases/download/a1.2024.10.11-1/colordesktop-linux-a1-1-x86_64.pkg.tar.zst')
sha256sums=('f1b9a4ebada34bb3e710fa403d54bd76d2d7a0557090cc7e7d6c8fb7c358f476')
OPTIONS=(!strip)
install=colordesktop.install

package() {
    tar -I zstd -xf colordesktop-linux-a1-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

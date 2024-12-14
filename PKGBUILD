# Maintainer: coloryr <402067010@qq.com>

pkgname=colordesktop
pkgver=3
pkgrel=1
pkgdesc="A Desktop Tools"
url="https://www.github.com/Coloryr/ColorDesktop"
arch=('x86_64')
packager="colordesktop"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorDesktop/releases/download/a3.2024.12.14-1/colordesktop-linux-a3-1-x86_64.pkg.tar.zst')
sha256sums=('eafa540f9d8353b57540d0af2f753539d939fe183174971876bc15e42577f1b3')
OPTIONS=(!strip)
install=colordesktop.install

package() {
    tar -I zstd -xf colordesktop-linux-a3-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

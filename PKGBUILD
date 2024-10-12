# Maintainer: coloryr <402067010@qq.com>

pkgname=colordesktop-bin
pkgver=1
pkgrel=2
pkgdesc="A Desktop Tools"
url="https://www.github.com/Coloryr/ColorDesktop"
arch=('x86_64')
packager="colordesktop"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorDesktop/releases/download/a1.2024.10.12-2/colordesktop-linux-a1-1-x86_64.pkg.tar.zst')
sha256sums=('b9113e8fa664ac03005fcea7f8d646e49bb7d5113c08917174ae64f1d1e115d7')
OPTIONS=(!strip)
install=colordesktop.install

package() {
    tar -I zstd -xf colordesktop-linux-a1-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

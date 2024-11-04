# Maintainer: coloryr <402067010@qq.com>

pkgname=colordesktop-bin
pkgver=2
pkgrel=1
pkgdesc="A Desktop Tools"
url="https://www.github.com/Coloryr/ColorDesktop"
arch=('x86_64')
packager="colordesktop"
license=('Apache 2.0')
source=('https://github.com/Coloryr/ColorDesktop/releases/download/a2.2024.11.4/colordesktop-linux-a2-1-x86_64.pkg.tar.zst')
sha256sums=('52ae2d34a886fbd69eec30db50fc0b5254e80b6094dcc1307a8b8a44561cef4b')
OPTIONS=(!strip)
install=colordesktop.install

package() {
    tar -I zstd -xf colordesktop-linux-a2-1-x86_64.pkg.tar.zst -C "$pkgdir"
    rm "$pkgdir/.BUILDINFO"
    rm "$pkgdir/.INSTALL"
    rm "$pkgdir/.MTREE"
    rm "$pkgdir/.PKGINFO"
}

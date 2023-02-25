# Maintainer: XXiaoA <isxxiaoa@gmail.com>

pkgname=ttf-maple-latest
pkgver=6.2
pkgrel=1
pkgdesc="Open source monospace/Nerd Font font with round corner for IDE and command line"
arch=("any")
url="https://gitee.com/subframe7536/Maple/"
license=("OFL")
provides=("ttf-maple-latest")
conflicts=("ttf-maple")
source=("https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono.zip"
        "https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
        "https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-SC-NF.zip"
       "LICENSE::https://raw.githubusercontent.com/subframe7536/Maple-font/v6.0/OFL.txt")
sha1sums=("2b635c45bf25cd590bd288e18edff6b45789051a"
          "f0b44a1827c875776a96d53b2aef0dd0e4037696"
          "f7839810fb73acfce6595318ed83fbbc49969339"
          "SKIP")

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/ttf/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$srcdir/NF/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$srcdir/SC-NF/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

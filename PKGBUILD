# Maintainer: XXiaoA <isxxiaoa@gmail.com>

pkgname=ttf-maple-latest
pkgver=6.1
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
sha1sums=("eb92f54700716199889204090ad6c9396154c7af"
          "2b212af0553ef4f2e8c634400ed089032ac2593a"
          "efc64a0c21744f9c00d86c03524a2af3f0747146"
          "SKIP")

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/ttf/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$srcdir/NF/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$srcdir/SC-NF/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

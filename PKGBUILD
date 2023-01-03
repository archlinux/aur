# Maintainer: XXiaoA <isxxiaoa@gmail.com>

pkgname=ttf-maple-latest
pkgver=6.0
pkgrel=2
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
sha1sums=("23eb56e99d3fa5f95929163a8f31115a116517ec"
          "5d8784362370acadbd6c6205fd611c546eaa4f57"
          "e69ca9488e46d396e4225597e58010cadc0be1c0"
          "SKIP")

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/ttf/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$srcdir/NF/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$srcdir/SC-NF/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

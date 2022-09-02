# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=5.5
pkgrel=3
pkgdesc="Open source monospace/Nerd Font font with round corner for IDE and command line"
arch=("any")
url="https://gitee.com/subframe7536/Maple/"
license=("OFL")
provides=("ttf-maple")
source=("https://gitee.com/subframe7536/Maple/releases/download/v$pkgver/MapleMono.zip"
        "https://gitee.com/subframe7536/Maple/releases/download/v$pkgver/MapleMono-NF.zip"
        "https://gitee.com/subframe7536/Maple/releases/download/v$pkgver/MapleMono-SC-NF.zip"
       "LICENSE::https://gitee.com/subframe7536/Maple/raw/v5/OFL.txt")
sha1sums=("2450A6EA9CA75F9F92EB5696216A24563796D3FF"
          "FF5A2353F3454EF7855F270968086222A0C19D13"
          "513170F994A94D5B10E96CCE7A0B7B6D63AB943D"
          "SKIP")

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

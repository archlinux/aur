# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=5.5
pkgrel=2
pkgdesc="Open source monospace font with round corner for IDE and command line"
arch=("any")
url="https://gitee.com/subframe7536/Maple/"
license=("OFL")
# depends=("")
# makedepends=("")
provides=("ttf-maple")
# conflicts=("")
source=("https://gitee.com/subframe7536/Maple/releases/download/v$pkgver/MapleMono.zip"
       "LICENSE::https://gitee.com/subframe7536/Maple/raw/v5/OFL.txt")
sha1sums=("2450A6EA9CA75F9F92EB5696216A24563796D3FF"
        "SKIP")

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

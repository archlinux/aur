# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=5.0
pkgrel=1
pkgdesc="Open source monospace font with round corner for IDE and command line"
arch=("any")
url="https://github.com/subframe7536/Maple-font"
license=("OFL")
# depends=("")
# makedepends=("")
provides=("ttf-maple")
# conflicts=("")
source=("https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/Maple.Mono.ttf.zip"
       "LICENSE::https://raw.githubusercontent.com/subframe7536/Maple-font/v5/OFL.txt")
md5sums=("SKIP"
        "SKIP")

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

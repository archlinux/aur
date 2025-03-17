# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=7.0
pkgrel=1
pkgdesc="Open source monospace/Nerd Font font with round corner for IDE and command line"
arch=("any")
url="https://github.com/subframe7536/maple-font"
license=("OFL")
conflicts=("ttf-maple-beta")
source=("$pkgname-$pkgver-MapleMono-ttf.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-TTF.zip"
        "$pkgname-$pkgver-MapleMono-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
        "$pkgname-$pkgver-MapleMono-SC-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-NF-CN.zip"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/subframe7536/Maple-font/main/OFL.txt")
sha256sums=('1609689e46e7a618b09b11a3ed9d28cdf1ccc29263efef7a83a58cb4c7b7ac8a'
            '1e066422b115e73991841bc0238fee4fe9df5210da0f41fcd6ea535df24d85a0'
            '214047481216fffbd6c25ba679f156e3c79250b26663d7bc17d62685bb7f294d'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

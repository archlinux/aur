# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=6.2
pkgrel=2
pkgdesc="Open source monospace/Nerd Font font with round corner for IDE and command line"
arch=("any")
url="https://gitee.com/subframe7536/Maple/"
license=("OFL")
source=("$pkgname-$pkgver-MapleMono.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono.zip"
        "$pkgname-$pkgver-MapleMono-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
        "$pkgname-$pkgver-MapleMono-SC-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-SC-NF.zip"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/subframe7536/Maple-font/v6.0/OFL.txt")
sha256sums=('2a11b48104671c5be9a3175cc924846160ed3a01b8c489bc5f451af68d5a193c'
            '3afe8011a2f2f34730ac5b6629651c788f34f52c01947b107f617cebfb1cffa0'
            '6dbeb6606cdd13daaf972b991bb608d7a80ec560be0228e544b63c113faae518'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/"*/"MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

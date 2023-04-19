# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=6.3
pkgrel=1
pkgdesc="Open source monospace/Nerd Font font with round corner for IDE and command line"
arch=("any")
url="https://gitee.com/subframe7536/Maple/"
license=("OFL")
source=("$pkgname-$pkgver-MapleMono.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono.zip"
        "$pkgname-$pkgver-MapleMono-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
        "$pkgname-$pkgver-MapleMono-SC-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-SC-NF.zip"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/subframe7536/Maple-font/main/OFL.txt")
sha256sums=('029e0ec0ffd0185cfdfb19f5dab7a489ad7fa7047166fbfe1fe6666625dcc5c6'
            '5991c54111bef354c5e5880e4f6e3d73c540f2f02f628c22431fe9aac0ee278a'
            'dbaa1d9263258c4c2cb51cb00d827b0ecb79a5f397aed41372b145c5b4701dc0'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "$srcdir/"*/"MapleMono-"*.ttf "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

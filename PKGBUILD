# Maintainer: Yuandi <realyuandi42@gmail.com>

pkgname=ttf-maple
pkgver=6.4
pkgrel=1
pkgdesc="Open source monospace/Nerd Font font with round corner for IDE and command line"
arch=("any")
url="https://github.com/subframe7536/maple-font"
license=("OFL")
source=("$pkgname-$pkgver-MapleMono-ttf.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-ttf.zip"
        "$pkgname-$pkgver-MapleMono-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-NF.zip"
        "$pkgname-$pkgver-MapleMono-SC-NF.zip::https://github.com/subframe7536/Maple-font/releases/download/v$pkgver/MapleMono-SC-NF.zip"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/subframe7536/Maple-font/main/OFL.txt")
sha256sums=('6b4e892c83f96956fd49e133ea4c3e2ea2b2d3274281a5253c31560366341bc4'
            '7f2fa17546190d6e6790c562ae1926cacded22459eccf0eb9693719d1325e165'
            '49b5d692ba4b254aeaf89b758771813fd99de536d8a4f721762474a040cc0206'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

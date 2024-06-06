# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Ziqi Yang <mr.ziqiyang@gmail.com>

pkgname='ttf-lxgw-neo-xihei-screen-full'
pkgver=1.123.2
pkgrel=1
pkgdesc="霞鹜新晰黑屏幕阅读版Droid Sans Fallback打底补全版，更适合 PC 及 Android 手机屏幕显示。"
arch=("any")
url="https://github.com/lxgw/LxgwNeoXiHei-Screen"
license=("LicenseRef-IPA")
source=("${pkgname}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/v${pkgver}/LXGWNeoXiHeiScreenFull.ttf"
        "LICENSE.md"
        "LICENSE_CHS.md")
sha256sums=('d6f75f33c2b8de8a8065a546d80dbab7b393b64ae33d2ecc09c4d4b23c0bbae6'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1')

package() {
    install -Dm 644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}.ttf"

    for item in LICENSE*.md
    do
        install -Dm 644 ${item} "${pkgdir}/usr/share/licenses/${pkgname}/${item}"
    done
}

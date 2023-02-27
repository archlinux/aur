# Maintainer: taotieren <admin@taotieren.com>

pkgbase=longzhuti
pkgname=(ttf-longzhuti)
pkgver=1.000
pkgrel=1
pkgdesc="龙珠体 | LongZhuTi"
url="https://github.com/maoken-fonts/LongZhuTi"
depends=(fontconfig)
license=("custom:OFL")
arch=(any)
source=(
    "LogoSCLongZhuTi-Regular${pkgver}.ttf::${url}/releases/download/v$pkgver/LogoSCLongZhuTi-Regular.ttf"
    "LogoSCLongZhuTiZHS-Regular${pkgver}.ttf::${url}/releases/download/v$pkgver/LogoSCLongZhuTiZHS-Regular.ttf"
    "LongZhuTi-Regular${pkgver}.ttf::${url}/releases/download/v$pkgver/LongZhuTi-Regular.ttf "
    "LICENSE${pkgver}::https://raw.githubusercontent.com/maoken-fonts/LongZhuTi/main/OFL.txt"
    "LICENSE-ZHS${pkgver}::https://raw.githubusercontent.com/maoken-fonts/LongZhuTi/main/OFL_ZHS.txt"
)

sha256sums=('977c43b9d16458517eb9503a847e7f58fdad803850bb1d63f6e14d5d09d11142'
            '0180f21c9911bc2358cbbee0674cd51e783f3f63e09ffb08b03b082e6e400bdc'
            'a7c16e4ec41419981f2a54b35a0ec8f3dba61884b8b8e03721fed179f2088102'
            'ffa9b3b3903dc0904dde70e3023124b8b73acfd268ba2189a300a29cb5734057'
            'cbb5cbe68fe081b6ecd96b2684b2345121cec0ed3e661735ac5d671630197f1b')

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/licenses/${pkgname}"
    install -m644 LogoSCLongZhuTi-Regular${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/LogoSCLongZhuTi-Regular.ttf"
    install -m644 LogoSCLongZhuTiZHS-Regular${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/LogoSCLongZhuTiZHS-Regular.ttf"
    install -m644 LongZhuTi-Regular${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/LongZhuTi-Regular.ttf"
    install -m644 LICENSE${pkgver} "$pkgdir/usr/share/licenses/${pkgname}/"
    install -m644 LICENSE-ZHS${pkgver} "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-ZHS"
}
# vim: ts=4 sw=4 et

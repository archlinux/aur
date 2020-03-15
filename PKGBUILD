# Maintainer: Patrick Young <16604643+kmahyyg@users.noreply.github.com>

pkgname=ttf-itxe-sans
pkgver=1.0
pkgrel=1
_reltag='v20200315'
pkgdesc='A sans fonts by ITXE Studio , optimized from Comic Sans'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
arch=('any')
url="https://fonts.idc.moe"
license=('custom:ITXE Custom Font License v1.0')
source=(
    "ITXESans-${pkgver}.ttf::https://github.com/kmahyyg/personal_pkgbuild/releases/download/${_reltag}/ITXESans-${pkgver}.ttf"
    "${pkgname}-${pkgver}-CFL.txt::https://github.com/kmahyyg/personal_pkgbuild/raw/master/${pkgname}/${pkgname}-${pkgver}-CFL.txt"
)
sha256sums=(
    'f8b3e8d39488f12fdab63e1bf15bd19c21a572f9c126f6b67dcaebe32677ccf8'
    '53fe3503f968274d0a605773f3b03a34fc7e42259e2974ac9cdc6a210be46aea'
)
package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 ITXESans-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/ITXESans.ttf"
    install -Dm644 ${pkgname}-${pkgver}-CFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

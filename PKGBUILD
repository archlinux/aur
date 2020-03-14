# Maintainer: Patrick Young <16604643+kmahyyg@users.noreply.github.com>

pkgname=ttf-itxe-writing
pkgver=1.0
pkgrel=1
_reltag='v20200314'
pkgdesc='A beautiful and elegant hand-writing fonts by ITXE Studio'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
arch=('any')
url="https://fonts.idc.moe"
license=('custom:ITXE Custom Font License v1.0')
source=(
    "ITXEWriting-${pkgver}.ttf::https://github.com/kmahyyg/personal_pkgbuild/releases/download/${_reltag}/ITXEWriting-${pkgver}.ttf"
    "${pkgname}-${pkgver}-CFL.txt::https://github.com/kmahyyg/personal_pkgbuild/raw/master/ttf-itxe-writing/${pkgname}-${pkgver}-CFL.txt"
)
sha256sums=(
    '1ec3934aedffa8f63e5260e77d0189f81b0e7e1faf0db961ee39e1efefa241f2'
    'aaa18aff1c138548bb47ab9941a7566a1541f2d2b14f0627ece934be2cff6aa5'
)
package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 ITXEWriting-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/ITEXWriting.ttf"
    install -Dm644 ${pkgname}-${pkgver}-CFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>

pkgname=ttf-livvic
pkgver=1.000
pkgrel=1
pkgdesc='Liverpool Victoria Friendly Society Limited custom typeface'
arch=('any')
url='https://github.com/Fonthausen/Livvic'
_commit='b79e957c463c3a6cbca8c92947b022507edb75e4'
_fontname='Livvic'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-google-fonts-git' 'ttf-google-fonts')
source=("${_fontname}-Black-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Black.ttf"
        "${_fontname}-BlackItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-BlackItalic.ttf"
        "${_fontname}-Bold-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Bold.ttf"
        "${_fontname}-BoldItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-BoldItalic.ttf"
        "${_fontname}-ExtraLight-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-ExtraLight.ttf"
        "${_fontname}-ExtraLightItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-ExtraLightItalic.ttf"
        "${_fontname}-Italic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Italic.ttf"
        "${_fontname}-Light-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Light.ttf"
        "${_fontname}-LightItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-LightItalic.ttf"
        "${_fontname}-Medium-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Medium.ttf"
        "${_fontname}-MediumItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-MediumItalic.ttf"
        "${_fontname}-Regular-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Regular.ttf"
        "${_fontname}-SemiBold-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-SemiBold.ttf"
        "${_fontname}-SemiBoldItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-SemiBoldItalic.ttf"
        "${_fontname}-Thin-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-Thin.ttf"
        "${_fontname}-ThinItalic-${pkgver}.ttf::${url}/raw/${_commit}/fonts/ttf/${_fontname}-ThinItalic.ttf"
        "${pkgname}-${pkgver}-OFL.txt::${url}/raw/${_commit}/OFL.txt")
sha256sums=('74bd80e69f49a9fa1e12bccb6d0c0a2a836c5a282484ceb0d93b24c4500f01b5'
            '1e47a355b8d27c41616eafe4239b8eaabb325cfd0c6c7c69a024beb380c3b8a7'
            '8cfcb937882f9e1bff66d9ab7fb3460decd4acbdf85124cc0f9caed5157ae22e'
            '1a185f6506382568e31aef8940622b13e991a5911e9163d683bf8cd5b0106a17'
            'e4b68729c8ba7ca7910e18c851f5deded98fc85e884e3a96e7d91f1be0f9fd76'
            'c54bae67f61277221e7336d16951b88d9271b5c5122a91e380fb111c31742b0c'
            '0d921d7b9db4c76b2ae0b32891c52f078d318119205ccfa181e005f7c2573273'
            'becc67bfca457c9de12d5ea3ea99edb24b8e22c7b63befbce128469d0f31f0b4'
            '744e7da3822cf4c615a6bc86bf639abec36ca275ef38efc8269a879c2b526151'
            'c38cf681bc7fbda6f0f4f39a10dc75cdb66e2dd0e88d3b78909b22ce078bec0d'
            '75bff5e8ec9e24a1685d03d85281457e4b3bb5d440f90a49d3c4c6be6fd0a5ae'
            'b4e462dd3944e57dfe59565a1a3ec828894abf31dfe00bec72a13a6a818cb601'
            'b06f52e8b41a0f6e9b6380f404497d62a76fdec5865c6fc3099d68c56085ebf4'
            'e540b37e6bf200dbef79b0ceea502b8d027290d315fd5c6f5a2e8567a418aa70'
            '429e4864aaaf3add5bde967759c5a3b924d70f82923f8bcdfb63cb8e6b5640b2'
            '7f92af32e50813c82a42f1761b6b972b0b69d2daaedcef1cd2612c99bea7f3a8'
            '0d0630b8fb51f80905ba9298e69ce7f3f0c080e019158b6aca469dded731ee1e')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 ${_fontname}-Black-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Black.ttf"
  install -m 644 ${_fontname}-BlackItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-BlackItalic.ttf"
  install -m 644 ${_fontname}-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Bold.ttf"
  install -m 644 ${_fontname}-BoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-BoldItalic.ttf"
  install -m 644 ${_fontname}-ExtraLight-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-ExtraLight.ttf"
  install -m 644 ${_fontname}-ExtraLightItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-ExtraLightItalic.ttf"
  install -m 644 ${_fontname}-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Italic.ttf"
  install -m 644 ${_fontname}-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Light.ttf"
  install -m 644 ${_fontname}-LightItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-LightItalic.ttf"
  install -m 644 ${_fontname}-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Medium.ttf"
  install -m 644 ${_fontname}-MediumItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-MediumItalic.ttf"
  install -m 644 ${_fontname}-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Regular.ttf"
  install -m 644 ${_fontname}-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-SemiBold.ttf"
  install -m 644 ${_fontname}-SemiBoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-SemiBoldItalic.ttf"
  install -m 644 ${_fontname}-Thin-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-Thin.ttf"
  install -m 644 ${_fontname}-ThinItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/${_fontname}-ThinItalic.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Dmitry <dmitry@ykkz.de>

pkgname=ttf-cuprum
pkgver=2.000
pkgrel=1
pkgdesc='Cuprum is a narrow grotesque font. It is quite versatile.'
arch=('any')
url='https://fonts.google.com/specimen/Cuprum'
license=('Open Font License')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')

_commit='8c86543d1ef0a348ad471a3443a3ab0a2a0162c8'
_raw="https://github.com/alexeiva/cuprum/raw/${_commit}/fonts/ttf"

source=(
        "${_raw}/Cuprum-Bold.ttf"
        "${_raw}/Cuprum-BoldItalic.ttf"
        "${_raw}/Cuprum-Italic.ttf"
        "${_raw}/Cuprum-Regular.ttf"
        )

sha512sums=('b4c0aba89b7e3292705dfb7e59c9f10e6057fbb187e3a85a9b8113ef1e28c4cbd1497dca59a1183d87a2b0d88e82274f621dcb90cc0a37b6c013404bf5f11924'
            'c8521653afd769bbb9ec8628741c2e3df062aa9271481f2fd110bf8ce1d88eb234d0ceaab76b2d3683d22f63849d99b9ecfbf105d4a9ebc0ca89c18a90add9b3'
            '345a678a141303b5ee164249881ba52df4db0722571a61202d9d95a98fb727df575da9169ffdde1c1a8951e072e75483b07afa80d5dc9e0d8d2a36982a3f673c'
            'd9d661d2733f82373d9dc86fab718801d96e2c3e6a2c655a5bfc55b6a36334a39f5d42812d9b12fd0549951b14176e670e92b5f6dfeeb90f2b054bf9964f87a0')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

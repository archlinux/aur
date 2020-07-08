# Maintainer: Dmitry <dmitry@ykkz.de>

pkgname=ttf-spectral
pkgver=2.003
pkgrel=2
pkgdesc='Spectral is a new and versatile serif face'
arch=('any')
url='https://fonts.google.com/specimen/Spectral'
license=('Open Font License')
depends=('fontconfig' 'xorg-fonts-encodings')

_commit='748733e3761fc7985ca9c473996ed121954debf8'
_raw="https://github.com/productiontype/Spectral/raw/${_commit}/fonts/desktop"

source=(
        "${_raw}/Spectral-LightItalic.ttf"
        "${_raw}/Spectral-ExtraLightItalic.ttf"
        "${_raw}/Spectral-ExtraLight.ttf"
        "${_raw}/Spectral-ExtraBoldItalic.ttf"
        "${_raw}/Spectral-Regular.ttf"
        "${_raw}/Spectral-SemiBold.ttf"
        "${_raw}/Spectral-Bold.ttf"
        "${_raw}/Spectral-Medium.ttf"
        "${_raw}/Spectral-BoldItalic.ttf"
        "${_raw}/Spectral-MediumItalic.ttf"
        "${_raw}/Spectral-Italic.ttf"
        "${_raw}/Spectral-ExtraBold.ttf"
        "${_raw}/Spectral-SemiBoldItalic.ttf"
        "${_raw}/Spectral-Light.ttf"
        )

sha256sums=('12543d21160dcf35625c424f5cff9c4d37bb3470822ee2e4324f6d48bc84d3d2'
            '20800f30b95f771ffc9bd15fafe4bfb4e6bec71960d1093c01ed3d746fa7e28c'
            '26b1f7ca61d1ef84aad506c4cef7655f348e60305d894e96602715be7d1ee8f4'
            '27960c9b1de098fe1b2607a538dc41e7bd0deeb47fa5f9b567de962a8b412847'
            '5b5dd7bdac375813024c11b88b4150f4a78f4932fffc36b89ec3fe5adafe59cf'
            '606c0db13e006150bef5a9ed028158a36096231d0d669d3198ce1e60741ea679'
            '674e04166857f66d08f59f9005786b921559ec827f5cd9c261b9302f9ca03fb8'
            '7362eb2caf4dfb76fce254ccd3888f8e20245e3b3c0f49c472c14d42c4aa37cf'
            '7c95aff02781d1041650023b5b085f515e83f48b6d7dd55db487bf18968f1f2d'
            '7d5c306de88aaa3dab80579d05b2971a934b8533999e89491f9ca5c0d5b09963'
            '8732e739ac13bf843aaeaed5386192c08b8a5ae10b8112147569862fcdaecebd'
            '8d3b2570b49173801e003ff93b3bb4d33db1c73e6a34bdce12907414c01cbd20'
            '8f25bc122366feed8d04d3e7c99fd255390a63931393de7028680e6865ae8f64'
            'f4ef08fca88e2be3c35b82fc2d17a806a77dd5214eff58e8bc55ca1aa19910ca')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="raleway-family"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=3.000
pkgrel=2
pkgdesc="Matt McInerney's Raleway family, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-raleway')
provides=('ttf-raleway')
#install=updatefont.install
_path=https://raw.githubusercontent.com/impallari/Raleway/master/fonts/v3.000%20Fontlab/TTF
source=("${_path}/Raleway-Black-Italic.ttf"
        "${_path}/Raleway-Black.ttf"
        "${_path}/Raleway-Bold-Italic.ttf"
        "${_path}/Raleway-Bold.ttf"
        "${_path}/Raleway-ExtraBold-Italic.ttf"
        "${_path}/Raleway-ExtraBold.ttf"
        "${_path}/Raleway-ExtraLight-Italic.ttf"
        "${_path}/Raleway-ExtraLight.ttf"
        "${_path}/Raleway-Light-Italic.ttf"
        "${_path}/Raleway-Light.ttf"
        "${_path}/Raleway-Medium-Italic.ttf"
        "${_path}/Raleway-Medium.ttf"
        "${_path}/Raleway-Regular-Italic.ttf"
        "${_path}/Raleway-Regular.ttf"
        "${_path}/Raleway-SemiBold-Italic.ttf"
        "${_path}/Raleway-SemiBold.ttf"
        "${_path}/Raleway-Thin-Italic.ttf"
        "${_path}/Raleway-Thin.ttf"
        "https://raw.githubusercontent.com/impallari/Raleway/master/CONTRIBUTORS.txt"
        "https://raw.githubusercontent.com/impallari/Raleway/master/FONTLOG.txt"
        "https://raw.githubusercontent.com/impallari/Raleway/master/OFL.txt"
        "https://raw.githubusercontent.com/impallari/Raleway/master/README.md")
md5sums=('0f629c963866f90e4ffa05550def8af3'
         'd641109f46a9231b7a92d6a114302a2b'
         '02d3658bf349556ce8c3486c55bb703b'
         'f5c9c1aa2ac56e1f75b17c63c0a594bc'
         '8832d30f890da4120277ce31511440f3'
         '299ddfe9ee671626b0fe97cd94cfbb3b'
         '91fc8a226846c0aafdf32f1158585bee'
         'ebd5c800e24e108dd3aeacb28e16c595'
         'fa415a9d96fefcef9dcd7c0f8938bdcb'
         '6b562d7ca359ccb3259f570bcceb4f70'
         'c966b8622dc3df06f4dcb637212cd92f'
         '2e763f88811273e662c149e71ba9e984'
         'b1f58e1bdc559a465620e1e48d08f460'
         '2d4cd8722065da2ac700199273325752'
         '4bd987dee3441560d67deaf159d2feda'
         'e18d3880935810355cd07b95337c381d'
         'f8708e6ab83f9e2e11c2bd0c0ecf93a6'
         'ebd07bb4e01077b3736004a5305ce741'
         '7277dc8d4e38b6a287b20fb9b099341c'
         '9305580e67ac5887264260081a59adfc'
         '52a45f434f9a511a88f9e2adeead6e06'
         '1d7d61f5f68930da9de99490186f8903')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 CONTRIBUTORS.txt FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}

# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-mono
pkgver=2.000985
pkgrel=3
epoch=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Roboto Mono is a monospaced addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Mono'
license=('Apache')
source=('https://raw.githubusercontent.com/google/fonts/master/apache/robotomono/LICENSE.txt'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Bold.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-BoldItalic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Italic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Light.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-LightItalic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Medium.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-MediumItalic.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Regular.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-Thin.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/apache/robotomono//RobotoMono-ThinItalic.ttf')
install=${pkgname}.install
md5sums=('3b83ef96387f14655fc854ddc3c6bd57'
         'cf661842dcc7e1cc63147893ea8f47e8'
         '28c34883fca976c0d408c1a0a8596ece'
         '7b4c715c7e2b43e8f001c601f4fecbb0'
         '9b4c4c06ac376ebef3ae1c83555d6767'
         '4b6b29f4f439c2414ea0c1c361b608b4'
         '548b8b0a28c87e0265346c17b1238f00'
         '6036f5eb9eec7734ed04e34b8b0ae0c4'
         'e2642a6882ef2432ee9ac442691a4384'
         'd39c55b13b4cc7c89cda63c57d8edd65'
         '3f0693690fe21427118fbd554f7a0a0f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# Maintainer: Orffen <orffen@orffenspace.com>
pkgname=otf-aileron
pkgver=0.102
pkgrel=1
pkgdesc="A grotesque sans-serif font by dot colon."
arch=('i686' 'x86_64')
url="http://dotcolon.net/font/aileron/"
license=('custom:CC0')
depends=()
provides=('otf-aileron')
install=otf.install
source=('http://dotcolon.net/DL/font/aileron.zip'
        'http://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
md5sums=('c2c609c1043931188df4838d66367e55'
         '65d3616852dbf7b1a6d4b53b00626032')

package() {

  install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  mkdir -p ${pkgdir}/usr/share/fonts/OTF
  install -m644 Aileron-BlackItalic.otf      "${pkgdir}/usr/share/fonts/OTF/Aileron-BlackItalic.otf"
  install -m644 Aileron-Black.otf            "${pkgdir}/usr/share/fonts/OTF/Aileron-Black.otf"
  install -m644 Aileron-BoldItalic.otf       "${pkgdir}/usr/share/fonts/OTF/Aileron-BoldItalic.otf"
  install -m644 Aileron-Bold.otf             "${pkgdir}/usr/share/fonts/OTF/Aileron-Bold.otf"
  install -m644 Aileron-HeavyItalic.otf      "${pkgdir}/usr/share/fonts/OTF/Aileron-HeavyItalic.otf"
  install -m644 Aileron-Heavy.otf            "${pkgdir}/usr/share/fonts/OTF/Aileron-Heavy.otf"
  install -m644 Aileron-Italic.otf           "${pkgdir}/usr/share/fonts/OTF/Aileron-Italic.otf"
  install -m644 Aileron-LightItalic.otf      "${pkgdir}/usr/share/fonts/OTF/Aileron-LightItalic.otf"
  install -m644 Aileron-Light.otf            "${pkgdir}/usr/share/fonts/OTF/Aileron-Light.otf"
  install -m644 Aileron-Regular.otf          "${pkgdir}/usr/share/fonts/OTF/Aileron-Regular.otf"
  install -m644 Aileron-SemiBoldItalic.otf   "${pkgdir}/usr/share/fonts/OTF/Aileron-SemiBoldItalic.otf"
  install -m644 Aileron-SemiBold.otf         "${pkgdir}/usr/share/fonts/OTF/Aileron-SemiBold.otf"
  install -m644 Aileron-ThinItalic.otf       "${pkgdir}/usr/share/fonts/OTF/Aileron-ThinItalic.otf"
  install -m644 Aileron-Thin.otf             "${pkgdir}/usr/share/fonts/OTF/Aileron-Thin.otf"
  install -m644 Aileron-UltraLightItalic.otf "${pkgdir}/usr/share/fonts/OTF/Aileron-UltraLightItalic.otf"
  install -m644 Aileron-UltraLight.otf       "${pkgdir}/usr/share/fonts/OTF/Aileron-UltraLight.otf"
}

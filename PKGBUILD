# Maintainer: Orffen <orffen@orffenspace.com>
pkgname=otf-aileron
pkgver=0.102
pkgrel=3
pkgdesc="A grotesque sans-serif font by dot colon."
arch=('any')
url="http://dotcolon.net/font/aileron/"
license=('custom:CC0')
provides=('otf-aileron')
source=('http://dotcolon.net/DL/font/aileron.zip'
        'http://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
sha256sums=('a93a1327f44912a7b1410ad0056fec3e904074413b0bd9da550f6175587cf958'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {

  install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 Aileron-*.otf "${pkgdir}/usr/share/fonts/OTF/"
}


# Maintainer: Orffen <orffen@orffenspace.com>
pkgname=otf-aileron
pkgver=0.102
pkgrel=2
pkgdesc="A grotesque sans-serif font by dot colon."
arch=('i686' 'x86_64')
url="http://dotcolon.net/font/aileron/"
license=('custom:CC0')
provides=('otf-aileron')
source=('http://dotcolon.net/DL/font/aileron.zip'
        'http://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
md5sums=('c2c609c1043931188df4838d66367e55'
         '65d3616852dbf7b1a6d4b53b00626032')

package() {

  install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 Aileron-*.otf "${pkgdir}/usr/share/fonts/OTF/"
}


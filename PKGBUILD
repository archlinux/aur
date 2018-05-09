# Maintainer: Tomasz Tak <nerd@linux.pl>

pkgname=ttf-labiryntowy
pkgver=1.53
pkgrel=1
pkgdesc='Artificial font consisting of vertical and horizontal bars'
arch=('any')
url='http://alfabet-ozdobny.appspot.com/?str=labiryntowy'
license=('OFL')
depends=('fontconfig')
source=('https://alfabet-ozdobny.appspot.com/images/Labiryntowy_pl.tgz')
md5sums=('6791c1714d1908f6d1bd9a464b1f6750')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 Labiryntowy-1.53-pl.ttf "${pkgdir}/usr/share/fonts/TTF/Labiryntowy.ttf"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 opis.txt "${pkgdir}/usr/share/doc/opis.txt"
  install -m644 OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

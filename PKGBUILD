# Maintainer: idbentley <ian.bentley at gmail dot com>
pkgname=ttf-belligerent-madness
pkgver=1
pkgrel=1
pkgdesc="A true type font by P.D. Magnus. Brushed, Distressed, Grunge, Rough"
arch=(any)
license=('Font Monkey License v1.00')
url='https://www.fontsquirrel.com/fonts/Belligerent-Madness'
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.fontmonkey.com/font/belligerent.zip')
install=$pkgname.install
md5sums=('a13206e11bf45936a464176892e70da2')


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 "${srcdir}/belligerent/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm644 "${srcdir}/belligerent/readme.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=ttf-alef
pkgver=1
pkgrel=2
pkgdesc="A free multi-lingual sans-serif font designed specifically for screens."
arch=(any)
license=('SIL Open Font License (OFL)')
url='http://alef.hagilda.com/'
depends=('fontconfig' 'xorg-mkfontscale')
source=('http://alef.hagilda.com/Alef.zip')
install=$pkgname.install
md5sums=('968845a7f0d90f496550944639f09d59')


package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 "${srcdir}/TTF/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm644 "${srcdir}/OFL-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: Markus Tacker <m@coderbyheart.de>

pkgname=ttf-anonymous-pro-minus
pkgver=1.003
pkgrel=1
pkgdesc="Anonymous Pro (2009) is a family of four fixed-width fonts designed with coding in mind. There are two versions: Anonymous Pro and Anonymous Pro Minus. Anonymous Pro contains embedded bitmaps for smaller sizes, Anonymous Pro Minus does not."
arch=('any')
license=('custom:OFL')
url='http://www.marksimonson.com/fonts/view/anonymous-pro'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-anonymous-pro-minus.install
source=("http://www.marksimonson.com/assets/content/fonts/AnonymousProMinus-${pkgver}.zip")
md5sums=('16468f49e2a56f8e2ad39f09728391bd')

package() {
  cd "${srcdir}/AnonymousProMinus-${pkgver}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -D -m644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

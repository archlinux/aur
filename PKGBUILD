pkgname=ttf-averia-serif-libre
pkgver=1.0
pkgrel=1
pkgdesc="Averia Serif Libre fonts, typeface a bit gentle from Averia Serif"
url="http://iotic.com/averia/"
license=('GPL' 'custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(${pkgname}-${pkgver}::'http://www.1001freefonts.com/d/5521/averia_serif_libre.zip')
install=$pkgname.install

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

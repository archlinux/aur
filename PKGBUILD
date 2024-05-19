# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=otf-tenderness
pkgver=0.601
pkgrel=6
pkgdesc='Serif font with a soft impression'
arch=('any')
url='https://dotcolon.net/font/tenderness'
license=('OFL-1.1')
source=("https://dotcolon.net/downloads/fonts/tenderness_${pkgver/./}.zip")
sha256sums=('e9d512398aca5ae3633795b80918af30df7c7d616a5c381d130bf8ca32037891')

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/*.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 OFL.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

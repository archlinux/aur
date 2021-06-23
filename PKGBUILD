# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-tenderness
pkgver=0.601
pkgrel=3
pkgdesc='Serif font with a soft impression'
arch=('any')
url='http://dotcolon.net/font/?id=tenderness'
license=('custom')
source=("http://dotcolon.net/download/fonts/tenderness_${pkgver/./}.zip")
sha256sums=('e9d512398aca5ae3633795b80918af30df7c7d616a5c381d130bf8ca32037891')

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/*.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 OFL.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

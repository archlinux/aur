# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-tenderness
pkgver=0.601
pkgrel=1
pkgdesc='Serif font with a soft impression'
arch=('any')
url='http://dotcolon.net/font/?id=tenderness'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=("http://dotcolon.net/DL/font/tenderness_${pkgver/./}.zip")
sha256sums=('e9d512398aca5ae3633795b80918af30df7c7d616a5c381d130bf8ca32037891')

package() {
  cd "${srcdir}"

  install -Dm644 Tenderness-Regular.otf "${pkgdir}"/usr/share/fonts/OTF/Tenderness-Regular.otf
  install -Dm644 OFL.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

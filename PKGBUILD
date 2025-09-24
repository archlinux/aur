# Maintainer: Tianchuan Lin <lintianchuan24@gmail.com>

pkgname=otf-xcharter-math
pkgver=0.66
pkgrel=1
pkgdesc="Unicode Math font XCharter-Math.otf meant to be used together with XCharter Opentype Text fonts (extension of Bitstream Charter)" 
url="https://www.ctan.org/pkg/xcharter-math"
arch=('any')
license=('OFL')
source=(xcharter-math-${pkgver}.zip::http://mirrors.ctan.org/fonts/xcharter-math.zip)
sha256sums=('fe746a4f1232be739b41a01f5eee2867990a91104667b968b7079561b02a9f0c')

package() {
  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  cd xcharter-math
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"
}

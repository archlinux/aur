# Maintainer: bohoomil <@zoho.com>

pkgname=otf-neris
_basename=neris
pkgver=1.00
pkgrel=6
depends=('fontconfig')
pkgdesc="A display sans for one paragraph (or shorter) length text: quotes, openings, titles."
url="http://cargocollective.com/eimantas"
arch=('any')
license=('custom')
install=$pkgname.install
source=("http://dl.1001fonts.com/${_basename}.zip")
sha256sums=('a7e49014c699db81497f4f5251c135ab1a3c739cbe3f9e9e37c15b679e21fa0d')

package(){
  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "Eimantas Paskonis End-User License Agreement.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"
}


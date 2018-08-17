# Maintainer: David Pflug <david@pflug.email>
pkgname=ttf-bitstream-charter
pkgver=1.0
pkgrel=2
pkgdesc="TTF version of a serif typeface designed by Matthew Carter for low resolution devices"
arch=('any')
url="https://practicaltypography.com/charter.html"
license=('custom')
source=("http://practicaltypography.com/fonts/charter.zip")
sha256sums=('bcddb75c25406def3d461c6f161ce10f3b32433f5b2109fc0716782ff21285b7')

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/charter/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/charter/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

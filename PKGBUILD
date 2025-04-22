# Maintainer: Sadie <zulc22db plus oss at gmail dot com>

pkgname=ttf-dionicio3-2tile
pkgver=2.0.0
pkgrel=1
pkgdesc='This is my big font project with well over 9000 characters.'
arch=('any')
url='https://dionicio3.com/fonts/2tile/'
license=('custom:unspecified')
depends=('xorg-fonts-encodings')
source=('https://dionicio3.com/fonts/2tile/Dionicio3_2_Tile.ttf')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 Dionicio3_2_Tile.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
sha256sums=('475d98f0686e16f4f7a1ea428e349996a4611471b4a4af727533b471ff109eb3')

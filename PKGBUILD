# Maintainer: Philip Sequeira <phsequei at gmail dot com>

pkgname=otf-exo
pkgver=2.0
pkgrel=6
pkgdesc='A geometric sans serif font with a technological feel'
arch=('any')
url='http://ndiscovered.com/exo-2/'
license=('OFL')
depends=('fontconfig' 'xorg-mkfontdir')
source=('http://ndiscovered.com/archives/exo-2.zip')
md5sums=('e67adb2d16c6f9083d454001184cb619')
sha256sums=('afcc096f507585e571d3d2aa91fc2cdc19a11eefdaa79dd0d5ac747d5522db9a')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${srcdir}/Exo 2"/*.otf
}

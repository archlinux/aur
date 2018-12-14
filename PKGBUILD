# Maintainer: Syu Takayama <syu.takayama(at)gmail.com>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-cica
pkgver=4.1.1
pkgrel=1
pkgdesc="A Japanese monospace font for programming"
url="https://github.com/miiton/Cica"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=(https://github.com/miiton/Cica/releases/download/v${pkgver}/Cica-v${pkgver}.zip)
md5sums=('3244058131a3c9a4f0055bf989d64a2b')

package() {
  cd ${srcdir}
  
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

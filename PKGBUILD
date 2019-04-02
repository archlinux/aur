# Maintainer: Syu Takayama <syu.takayama(at)gmail.com>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-cica
pkgver=4.1.2
pkgrel=1
pkgdesc="A Japanese monospace font for programming"
url="https://github.com/miiton/Cica"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=(https://github.com/miiton/Cica/releases/download/v${pkgver}/Cica_v${pkgver}.zip)
md5sums=('643824a2f26dce99fedd41f9df5ded8c')

package() {
  cd ${srcdir}
  
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

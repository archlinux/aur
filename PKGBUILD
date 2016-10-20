# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-cica
pkgver=1.0.2
pkgrel=1
pkgdesc="Composite font with Ubuntu Mono and Rounded Mgen+."
url="https://github.com/miiton/Cica"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(Cica.zip::https://github.com/qothr/cabinet/blob/master/Cica.zip?raw=true)
md5sums=('5b0daba6aea3c54ca09a026e75a65ac7')

package() {
  cd ${srcdir}/Cica
  
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

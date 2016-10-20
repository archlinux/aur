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
source=(Cica.zip::https://github.com/qothr/cabinet/raw/master/Cica.zip)
md5sums=('afac6436cf774c4c76601cece36034b7')

package() {
  cd ${srcdir}
  ls
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

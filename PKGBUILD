# Contributor: scolobb <scolobb at colimite fr> #THX for the mirror
# Maintainer: EEva <eeva+aur at marvid fr>

pkgname=ttf-montserrat
provides=('ttf-montserrat')
pkgdesc="Gorgeous geometric font with extended latin support (Regular, Alternates, Subrayada)"
url="http://montserrat.zkysky.com.ar/en"
pkgver=1.0
pkgrel=2
arch=('i686' 'x86_64')
license=('SIL Open Font')
depends=()
install=ttf.install
makedepends=()
#source=('http://colimite.fr/aur-mirrors/Montserrat.tar.gz') #BACKUP
source=('http://marvid.fr/~eeva/mirror/Montserrat.tar.gz')
md5sums=('7722f9573b957b3278bef2ad928ad5b1')

package() {
  cd ${srcdir}/Montserrat-fontfamily

  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  install -m644 Montserrat-Black.ttf             "${pkgdir}/usr/share/fonts/TTF/Montserrat-Black.ttf"
  install -m644 Montserrat-Bold.ttf              "${pkgdir}/usr/share/fonts/TTF/Montserrat-Bold.ttf"
  install -m644 Montserrat-Light.ttf             "${pkgdir}/usr/share/fonts/TTF/Montserrat-Light.ttf"
  install -m644 Montserrat-Regular.ttf           "${pkgdir}/usr/share/fonts/TTF/Montserrat-Regular.ttf"
  install -m644 Montserrat-Thin.ttf              "${pkgdir}/usr/share/fonts/TTF/Montserrat-Thin.ttf"
  install -m644 MontserratAlternates-Bold.ttf    "${pkgdir}/usr/share/fonts/TTF/MontserratAlternates-Bold.ttf"
  install -m644 MontserratAlternates-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/MontserratAlternates-Regular.ttf"
  install -m644 MontserratSubrayada-Bold.ttf     "${pkgdir}/usr/share/fonts/TTF/MontserratSubrayada-Bold.ttf"
  install -m644 MontserratSubrayada-Regular.ttf  "${pkgdir}/usr/share/fonts/TTF/MontserratSubrayada-Regular.ttf"
}

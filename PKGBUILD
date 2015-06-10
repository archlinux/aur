# Maintainer: TioDuke <tioduke@gmail.com>

pkgname=chaloult
pkgver=1.0
pkgrel=1
pkgdesc="Chaloult condensé Truetype fonts."
arch=('any')
url="http://www.calq.gouv.qc.ca/normes/organismes.htm#modeles"
license=('custom')
install=ttf.install
source=(http://www.calq.gouv.qc.ca/normes/pc/Chaloult_pc.zip)
md5sums=('69a2a3d0f08fabdfd27efb63e5d35a25')

package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/usr/share/fonts/TTF/
  cp ${srcdir}/TrueType/CHALCDGN.TTF ${pkgdir}/usr/share/fonts/TTF/chalcdgn.ttf
  cp ${srcdir}/TrueType/CHALCN__.TTF ${pkgdir}/usr/share/fonts/TTF/chalcn__.ttf
  cp ${srcdir}/TrueType/CHALDGN_.TTF ${pkgdir}/usr/share/fonts/TTF/chaldgn_.ttf
  cp ${srcdir}/TrueType/CHALGIN_.TTF ${pkgdir}/usr/share/fonts/TTF/chalgin_.ttf
  cp ${srcdir}/TrueType/CHALSN__.TTF ${pkgdir}/usr/share/fonts/TTF/chalsn__.ttf
}



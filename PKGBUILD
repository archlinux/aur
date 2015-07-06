# Contributor: realitygaps <realitygaps AT yahoo DOT com>
# Maintainer: realitygaps <realitygaps AT yahoo DOT com>

pkgname=sitracker  
_pkgrealname=sit
pkgver=3.67
_pkgrealver=3.67p2

pkgrel=1
pkgdesc="Support Incident Tracker (or SiT!) is a web based helpdesk/support ticket system"
arch=('any')
url="http://www.sitracker.org/"
license=('GPL')
depends=('php')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/${pkgname}/stable/${pkgver}/${_pkgrealname}_${_pkgrealver}.tar.gz)
md5sums=('27531cc0647236fbd2e2dce52fc9b598')
build() {
  mkdir -p $pkgdir/srv/http/sitracker
  cp -r $srcdir/${_pkgrealname}-${pkgver}/* $pkgdir/srv/http/sitracker/
}




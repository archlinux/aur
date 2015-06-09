# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: Michael Zoech <michi.zoech+arch at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-findbugs
pkgver=3.0.1
_pkgdate=20150306
_extraver=5afe4d1
pkgrel=1
pkgdesc="FindBugs plugin for Eclipse"
arch=('any')
url="http://findbugs.sourceforge.net/"
license=('LGPL')
depends=('eclipse')
source=("http://downloads.sourceforge.net/project/findbugs/findbugs%20eclipse%20plugin/${pkgver}/edu.umd.cs.findbugs.plugin.eclipse_${pkgver}.${_pkgdate}-${_extraver}.zip")

package() {
  cd "${srcdir}"
  local dest="${pkgdir}/usr/share/eclipse/dropins/findbugs/eclipse/plugins"
  install -d "$dest"
  cp -r "edu.umd.cs.findbugs.plugin.eclipse_${pkgver}.${_pkgdate}-${_extraver}" "$dest"
}

sha256sums=('0320c733e5188a0a93ba136160e6d6479945d7f3f9dbd7817741ef96b3c02334')

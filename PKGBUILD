# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: Michael Zoech <michi.zoech+arch at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-findbugs
pkgver=2.0.3
_pkgdate=20131122
_extraver=15020
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

sha256sums=('1d1eff484fa859b0f7181c77b14b56d7d0a2c41476cb65a1bd3e79629e91b770')

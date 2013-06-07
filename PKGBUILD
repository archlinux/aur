# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: Michael Zoech <michi.zoech+arch at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-findbugs
pkgver=2.0.2
_pkgdate=20121204
pkgrel=1
pkgdesc="FindBugs plugin for Eclipse"
arch=('any')
url="http://findbugs.sourceforge.net/"
license=('LGPL')
depends=('eclipse')
source=("http://downloads.sourceforge.net/project/findbugs/findbugs%20eclipse%20plugin/${pkgver}/edu.umd.cs.findbugs.plugin.eclipse_${pkgver}.${_pkgdate}.zip")

package() {
  cd "${srcdir}"
  local dest="${pkgdir}/usr/share/eclipse/dropins/findbugs/eclipse/plugins"
  install -d "$dest"
  cp -r "edu.umd.cs.findbugs.plugin.eclipse_${pkgver}.${_pkgdate}" "$dest"
}

sha256sums=('d02d7f3eea3c56e2d2051950e54400675e39c5ae9ad7b67f1c3de42f065dd4b6')

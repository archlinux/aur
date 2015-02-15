# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: Michael Zoech <michi.zoech+arch at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-findbugs
pkgver=3.0.0
_pkgdate=20140706
_extraver=2cfb468
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

sha256sums=('9ed21548be987b418483b293376abcf8c150979f1b8bf5f1147e9a466a8fae97')

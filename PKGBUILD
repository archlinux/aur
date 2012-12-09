# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: Michael Zoech <michi.zoech+arch at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-findbugs
pkgver=2.0.1
_pkgdate=20120712
pkgrel=1
pkgdesc="FindBugs plugin for Eclipse"
arch=('any')
url="http://findbugs.sourceforge.net/"
license=('LGPL')
depends=('eclipse')
source=("http://downloads.sourceforge.net/project/findbugs/findbugs%20eclipse%20plugin/${pkgver}/edu.umd.cs.findbugs.plugin.eclipse_${pkgver}.${_pkgdate}.zip")

build() {
  cd "${srcdir}"
  local dest="${pkgdir}/usr/share/eclipse/dropins/findbugs/eclipse/plugins"
  install -d "$dest"
  cp -r "edu.umd.cs.findbugs.plugin.eclipse_${pkgver}.${_pkgdate}" "$dest"
}

sha256sums=('7025c7874beab02de5459b0a1831af906c9f5de5ba01f2cdedbfc1bd91c2f1ec')
